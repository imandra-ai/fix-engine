# FIX Engine Model
## Overview

The development of the FIX Engine model began at [Imandra Inc.](http://www.imandra.ai) (AI) as part of the [Imandra
Markets](https://www.imandra.ai) product. The model consists of an
executable formalisation of an administrative-level FIX engine, a
sample application-level model and a set of verified precise
statements about the engine's behaviour. The properties we verify are
derived from the English prose specification published by the FIX
Community.

There's an explicit interface between administrative and application
models to make it easier to generate the application-level logic from
a higher-level language (e.g., AI's Imandra Protocol Language or FIX Orchestra).

We hope this project will be the beginning of an industry-wide effort to
mathematically formalise the rules and algorithms that run the
financial markets. This formalisation will significantly benefit the
industry, cutting down time and costs for connecting (and ensuring
regulatory compliance of) the numerous systems relying on this
protocol.

This README will give you a brief overview of the project. For further information please seethe documentation page at https://docs.imandra.ai/fix-engine/

## Why

Having a complete formal model of the FIX protocol brings many
benefits. To name a few:

- Consensus: With the formal model, the industry has a precise,
  unambiguous foundation for describing, evaluating and
  improving the definitions and mechanics of the protocol.

- Queryable: A formal verification engine like Imandra can be used to
  ask and answer deep questions about the behaviour of the model
  automatically.

- Testing: Powerful model-based testing techniques can be used to
  automatically generate high-coverage test suites (see Test Suite
  section below).

- Executable: Outside of the Imandra-specific commands used in
  verification, the model itself is all valid OCaml code. You may use
  the full OCaml stack to compile and run the engine.

- Exportable: Using the OCaml stack, the model can be compiled into a
  number of target languages and library formats. The community can
  use the verified model to generate source code in other languages
  (e.g. C++ or Java) targeting specific proprietary (or open source)
  libraries.

- Simulation: The model can be used as the basis of simulation
  environments, using the verified engine as a semantic
  "gold-standard" and test oracle.

## How

The model is written in two languages: OCaml and IML. OCaml is a
functional language that is gaining tremendous momentum within the
financial services industry. For more information, please see
www.ocaml.org. For example, Jane Street a well-known market
participant is a strong supporter of the language, with an active
[blog](https://blogs.janestreet.com/category/ocaml/).

IML stands for Imandra Modelling Language - it is a pure subset of
OCaml for which we have developed a mechanised formal semantics. This
means that everything written in IML can be given a precise axiomatic
(i.e., mathematical) representation, and Imandra can then be used to
analyze and answer deep questions about the code. Although Imandra is
proprietary and requires a license to use, OCaml is open source and
there are a number of open source theorem provers which may be adapted
to reason about this model. For further information on theorem
provers, see Formal Verification section below.

## What

The model is currently targeting version 4.4 of the FIX protocol. Over
time, we plan to cover other relevant versions. View the technical
documentation for further information.

## Model Verification

In addition to the model source code, you will find a collection of
Verification Goals (VGs). VGs are statements in IML expressing
properties of the FIX engine model that we wish to verify. It's
important to note that IML is used for both building the model and
describing the properties we wish to verify about it.

Consider the following quote from Volume 2 of the FIX 4.4 specification:
> When either end of a FIX connection has not sent any data for [HeartBtInt] seconds, it will transmit a Heartbeat message.

One way to formalise that statement is to create two VGs:
- VG.1.1 - any outbound message will result in an updated `fe_last_time_data_sent` field
- VG.1.2 - any time update will result in check whether Heartbeat should be sent out

```ocaml

(* VG.1.1 *)
verify last_time_data_sent_gets_updated ( engine : fix_engine_state ) =
    let engine' = one_step ( engine ) in
    let cond = 
        begin
            engine.outgoing_fix_msg = None && engine'.outgoing_fix_msg <> None &&
            engine.fe_curr_mode <> Retransmit
        end in
    cond ==> (engine'.fe_last_time_data_sent = engine'.fe_curr_time )
;;

(** VG.1.2 *)
let outbound_msg_heartbeat ( m : full_top_level_msg option )=
    match m with
    | Some ( ValidMsg vmsg )  ->
        begin 
            match vmsg.full_msg_data with 
            | Full_FIX_Admin_Msg admin_msg  ->
                begin 
                    match admin_msg with 
                    | Full_Msg_Heartbeat _      -> true
                    | _                         -> false
                end 
            | _ -> false
        end
    | _ -> false
;;

let time_update_received ( m, last_time_data_sent, last_time_data_received, hbeat_interval : fix_engine_int_msg option * fix_utctimestamp * fix_utctimestamp * fix_duration ) =
    match m with
    | Some ( TimeChange tc_data ) -> 
        begin 
            let valid_send_time = utctimestamp_duration_Add ( last_time_data_sent, hbeat_interval ) in
            let valid_received_time = utctimestamp_duration_Add ( last_time_data_received, hbeat_interval ) in
            utctimestamp_GreaterThan ( tc_data, valid_send_time ) && utctimestamp_GreaterThan ( valid_received_time, tc_data )
        end
    | _ -> false
;;

verify hbeat_sent_if_no_data_sent ( engine : fix_engine_state ) =
    let engine' = one_step ( engine ) in 
    let cond =
        begin 
            not ( hbeat_interval_null ( engine.fe_heartbeat_interval )) &&
            engine.fe_curr_mode = ActiveSession && 
            is_int_message_valid ( engine ) && 
            is_state_valid ( engine ) && 
            time_update_received ( engine.incoming_int_msg, engine.fe_last_time_data_sent, engine.fe_last_data_received, engine.fe_heartbeat_interval )
        end in
    cond ==> outbound_msg_heartbeat ( engine'.outgoing_fix_msg )
;;
```

It's important to note that the 'translation' of the English-prose
statements into IML (or other mathematically precise formal languages)
may not be unique. The inherent ambiguity of natural languages is a
major reason why the efforts of formalising protocol specifications
must be collaborative and industry-wide.

Notice how this approach differs from traditional 'testing'. In the
statement above, we're making a high-level claim about the model
behaviour, and we can subject this claim to analysis over the entire
system state-space. When Imandra analyses the model with respect to
such a statement, it works to symbolically verify that the claim holds
in *all* possible scenarios. When such a claim does not hold, Imandra
works to construct a precise sequence of events (a "counterexample")
which exhibits a violation of the property.

For further information on model verification, see the [Model
Verification](https://fix.readme.io/docs/verification-overview)
section of the project's homepage.

## Test Suite Generation

A fundamental issue with financial trading systems is that they may be
in a virtually infinite number of possible states. That is, there are
infinitely many (or infeasibly many) possible sequences of incoming
messages which they may have to process.

With Imandra, we've built on recent advances in formal verification to
develop powerful new forms of model-based testing. These approaches
construct high-coverage test suites by 'decomposing' the state-space
of the system model into a finite number of symbolically described
'regions' of behaviour and then 'solving' for relevant
test-cases. Each region contains a set of symbolic constraints for the
input parameters and a corresponding invariant that the system should
obey whenever its inputs satisfy the constraints. Imandra also
generates corresponding coverage proofs verifying that the collection
of the generated regions properly covers the possible behaviours of
the decomposed algorithm. This forms a core part of Imandra's
"Testflow" framework for architecting and automatically deriving test
suites meeting rigorous state-space coverage metrics.

We will seek to ensure that the repository contains up-to-date Imandra
region decompositions and test packs for the latest models.

## Formal Verification

Traditionally, the application of formal verification has been
reserved to highly specialised teams (often with PhDs in the subject)
in academia, institutions such as NASA, and safety-critical industries
such as avionics and microprocessor design.

At AI, our mission is to democratize formal verification, bringing its
power to new industries in a user-friendly and scalable way. These
applications to new industries are powered by recent advances,
including CDCL-based Satisfiability (SAT) and Satisfiability Modulo
Theories (SMT) solving, nonlinear decision procedures and scalable
techniques for symbolic execution.

For more on our vision for formal verification for finance, see our
short explainer [video](https://vimeo.com/123746101).

AI has published several technical white papers about current application of FV to financial markets:
- [Case Study: 2015 SEC Fine Against UBS ATS](https://www.imandra.ai/case-study-2015-sec-fine-against-ubs-ats/)
- [Transparent Order Priority and Pricing](https://www.imandra.ai/transparent-order-priority-and-pricing/)
- [Creating Safe and Fair Markets](https://www.imandra.ai/creating-safe-and-fair-markets/)

AI has also written several public comments to regulatory proposals by the SEC and CFTC:
- [Response to Proposed Rule, Regulation Automated Trading (“Regulation AT”) RIN 3038-AD52](https://www.imandra.ai/ai-submits-reg-at-comment-letter/)
- [Response to Release No. 34-76474](https://www.imandra.ai/ai-submits-reg-ats-n-comment-letter/)

If you're interested in further background on techniques underlying Imandra, see the following academic papers:
- [Decidability of Univariate Real Algebra with Predicates for Rational and Integer Powers](http://www.cl.cam.ac.uk/~gp351/passmore-cade25-univqri.pdf)
- [A Complete Decision Procedure for Univariate Polynomial Problems in Isabelle/HOL](https://arxiv.org/abs/1506.08238)
- [Computation in Real Closed Infinitesimal and Transcendental Extensions of the Rationals](http://www.cl.cam.ac.uk/~gp351/infinitesimals.pdf)
- [The Strategy Challenge in SMT Solving](http://dl.acm.org/citation.cfm?id=2554475)
- [Collaborative Verification-Driven Engineering of Hybrid Systems](http://arxiv.org/abs/1403.6085)

And here are links to some great interactive and automated theorem provers:
- [ACL2](http://www.cs.utexas.edu/users/moore/acl2/)
- [Agda](http://wiki.portal.chalmers.se/agda/pmwiki.php)
- [Coq](https://coq.inria.fr)
- [Lean](https://leanprover.github.io)
- [Isabelle](https://isabelle.in.tum.de)
- [Matita](http://matita.cs.unibo.it/)
- [MetiTarski](https://www.cl.cam.ac.uk/~lp15/papers/Arith/)
- [Prover9 and Mace4](https://www.cs.unm.edu/~mccune/mace4/)
- [PVS](http://pvs.csl.sri.com/)
- [SPASS](http://www.mpi-inf.mpg.de/departments/automation-of-logic/software/spass-workbench/)
- [Z3](https://github.com/Z3Prover/z3)

For a great non-technical introduction to the discipline of
formal verification and some of its history, we recommend
["Mechanizing
Proof"](https://mitpress.mit.edu/books/mechanizing-proof) by Donald
Mackenzie.

For learning the mathematics behind the techniques, we suggest:
- [Handbook of Practical Logic and Automated Reasoning](http://www.cambridge.org/catalogue/catalogue.asp?isbn=9780521899574) by John Harrison, Intel
- [Coq'Art](https://www.labri.fr/perso/casteran/CoqArt/) by Yves Bertot and Pierre Castéran, INRIA
- [A Computational Logic](https://www.cs.utexas.edu/users/boyer/acl.pdf) and subsequent books by Robert S. Boyer and J Strother Moore, UT Austin
- [Isabelle/HOL - A Proof Assistant for Higher-Order Logic](https://www21.in.tum.de/~nipkow/LNCS2283/) by Tobias Nipkow, Lawrence C. Paulson and Markus Wenzel, Cambridge and T.U. München
- [Decision Procedures - An Algorithmic Point of View](http://www.decision-procedures.org/) by Daniel Kroening, Oxford and Ofer Strichman, Technion
- [Quantifier Elimination and Cylindrical Algebraic Decomposition](http://www.springer.com/us/book/9783211827949) by Bob Caviness and Jeremy Johnson (Eds.)
- [Symbolic Logic and Mechanical Theorem Proving](http://dl.acm.org/citation.cfm?id=550421) by Chin-Liang Chang and Richard Char-Tung Lee, NIH
- [Principles of Model Checking](https://mitpress.mit.edu/books/principles-model-checking) by Christel Baier and Joost-Pieter Katoen, T.U. Dresden and RWTH Aachen
- [Handbook of Automated Reasoning](http://www.sciencedirect.com/science/book/9780444508133) by Alan Robinson and Andrei Voronkov (Eds.)

If you have other relevant publications or academic papers related to
application of formal verification (or formal methods, etc) to
financial markets, please create a PR.


## License

Apache 2.0
