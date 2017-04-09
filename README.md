# FIX Engine Model
## Overview

FIX Engine model development started at AI as part of the [Imandra Markets product](https://m.imandra.ai). The model is an executable formalisation of an administrative-level FIX engine, a sample application-level model and a set of verified precise statements about the engine's behaviour. The properties we verify are derived from the English prose specification published by the FIX Community.

There's an explicit interface between administrative and application models to make it easier to generate the application-level logic from a higher-level language (e.g. AI's FIX DSL or FIX Orchestra).

We hope this project will be the beginning of industry-led effort to mathematically formalise the rules and algorithms that run the financial markets. Such formalisation would significantly benefit the industry, cutting down time and costs for connecting (and ensuring regulatory compliance of) the numerous systems relying on this protocol.

This README will give you a brief overview of the project. For further information please see:
- Project homepage at http://fix.readme.io
- Documentation at https://aestheticintegration.github.io/fix-engine/doc/

## Why

Having a complete formal model of the FIX protocol:
- Consensus on the precise mechanics of the protocol
- Queryable behaviour of the model - with FV engines like Imandra, you may ask deep questions about behaviour of the model without traversing the code
- Automatically generated test suite (see Test Suite section below)
- Outside of the few Imandra commands used in verification, the model is a valid OCaml code. You may use the full OCaml stack to compile it and run the binary.
- Generate source code in other languages (e.g. C++ or Java) targeting specific proprietary (or open source) libraries.
- Have a ready model for use within simulation environments.

## How
The model is written in 2 languages: OCaml and IML. OCaml is a purely functional language that is gaining tremendous momentum within the financial services industry. For more information, please see www.ocaml.org. For example, Jane Street a well-known market participant is a strong supported of the language - check out their [blog](https://blogs.janestreet.com/category/ocaml/).

IML stands for Imandra Modelling Language - it is a subset of OCaml for which AI has developed a formal semantics. This means that everything written in IML may be given a precise axiomatic representation. In fact, AI's Imandra automates this. Although Imandra is proprietary and requires a license to use, OCaml is open source and there are a number of open source theorem provers which may be adapted to reason about this model. For further information on theorem provers, see Formal Verification section below.

## What
The model is currently targeting version 4.4 of the FIX protocol. The goal is to expand the model to cover the other relevant versions. View the technical documentation for further information.

## Model Verification
In addition to the model source code, you will find a set of Verification Goals - statements in IML expressing properties of the FIX engine model that we wish to verify. It's important to note that IML is used for both, building the model and specifying statements about it.

Consider the following quote from Volume 2 of the 4.4 specification:
> When either end of a FIX connection has not sent any data for [HeartBtInt] seconds, it will transmit a Heartbeat message.

One way to formalise that statement is to create 2 Verification Goals (VGs):
- VG.1.1 - any outbound message will result in an updated `fe_last_time_data_sent` field
- VG.1.2 - any time update will result in check whether Heartbeat should be sent out

```ocaml

(* VG.1.1 *)
verify last_time_data_sent_gets_updated ( engine : fix_engine_state ) =
	let engine' = one_step ( engine ) in

	( engine.outgoing_fix_msg = None && engine'.outgoing_fix_msg <> None ) 
	==> (engine'.fe_last_time_data_sent = engine'.fe_curr_time )
;;

(** VG.1.2 *)
let outbound_msg_heartbeat ( m : full_top_level_msg option ) =
    match m with 
    | None  -> false
    | Some msg  ->
    match msg with
    | ValidMsg vmsg -> (
        match vmsg.full_msg_data with 
        | Full_FIX_Admin_Msg admin_msg  -> (
            match admin_msg with 
            | Full_Msg_Hearbeat _       -> true
            | Full_Msg_Test_Request _   -> true
            | _                         -> false
        )
        | _ -> false
    )
    | _ -> false
;;

let time_update_received ( m, last_time_data_sent, hbeat_interval : fix_engine_int_msg option * fix_utctimestamp * fix_duration ) =
    match m with
    | None -> false
    | Some mint -> 
    match mint with 
    | TimeChange tc_data -> 
        let valid_time = utctimestamp_add ( last_time_data_sent, hbeat_interval ) in
        utctimestamp_greaterThan ( tc_data, valid_time )
    | _ -> false
;;

verify hbeat_sent_if_no_data_received ( engine : fix_engine_state ) =
    let engine' = one_step ( engine ) in ( 
    engine.fe_curr_mode = ActiveSession && 
    is_int_message_valid ( engine) && 
    is_state_valid ( engine ) && 
    time_update_received ( engine.incoming_int_msg, engine.fe_last_time_data_sent, engine.fe_heartbeat_interval ) )
    
    ==> outbound_msg_heartbeat ( engine'.outgoing_fix_msg )
;;

```

It's important to note that the 'translation' of the English-prose statements into IML (or other mathematically precise languages) may not be unique due to the natural ambiguity of English (or any other spoken languages). This is why such efforts of formalising protocol specifications must be industry-led.

Note how much more powerful this approach is compared to traditional 'testing'. In the statement above, we're making a very 'high level' claim about the model behaviour. 

For further information on model verification, see [Model Verification](https://fix.readme.io/docs/verification-overview) section of the project's homepage.

## Test Suite Generation
The fundamental issue with financial trading systems that they may be in a virtually 'infinite' number of possible states - that is, there are virtually infinitely many possible sequences of incoming messages which they may have to process. How does one 

AI has developed fundamentally different approach to analysing behaviour of such systems by 'decomposing' their virtually infinitely complex behaviour into a finite number of 'regions'. Each region contains a set of symbolic constraints for the input parameters and a corresponding invariant. Imandra also generates a corresponding proof that the collection of the generated regions fully covers the domain and range of the decomposed algorithm.

We will seek to ensure that the repository contains up-to-date region decomposition for the latest models. 

## Formal Verification
Traditionally, term "formal verification" has been reserved to academia, hardware manufacturing and avionics industries. Because of several recent breakthroughs in this field, FV is 

AI has also created short explainer [video](https://vimeo.com/123746101) that you might find interesting.

AI has published several technical white papers about current application of FV to financial markets:
- [Case Study: 2015 SEC Fine Against UBS ATS](https://www.imandra.ai/case-study-2015-sec-fine-against-ubs-ats/)
- [Transparent Order Priority and Pricing](https://www.imandra.ai/transparent-order-priority-and-pricing/)
- [Creating Safe and Fair Markets](https://www.imandra.ai/creating-safe-and-fair-markets/)

AI has also written several public comments to regulatory proposals by the SEC and CFTC:
- [Response to Proposed Rule, Regulation Automated Trading (“Regulation AT”) RIN 3038-AD52](https://www.imandra.ai/ai-submits-reg-at-comment-letter/)
- [Response to Release No. 34-76474](https://www.imandra.ai/ai-submits-reg-ats-n-comment-letter/)

If you're interested in further papers, see the following academic papers:
- [Decidability of Univariate Real Algebra with Predicates for Rational and Integer Powers](http://www.cl.cam.ac.uk/~gp351/passmore-cade25-univqri.pdf)
- [A Complete Decision Procedure for Univariate Polynomial Problems in Isabelle/HOL](https://arxiv.org/abs/1506.08238)
- [Computation in Real Closed Infinitesimal and Transcendental Extensions of the Rationals](http://www.cl.cam.ac.uk/~gp351/infinitesimals.pdf)
- [Collaborative Verification-Driven Engineering of Hybrid Systems](http://arxiv.org/abs/1403.6085)

A small list of great automated theorem provers:
- [Isabelle](https://isabelle.in.tum.de)
- [Coq](https://coq.inria.fr)
- [ALC2](http://www.cs.utexas.edu/users/moore/acl2/)

For a great non-technical introduction to the discipline of formal verification, we recommend ["Mechanizing Proof" by Donald Mackenzie](https://mitpress.mit.edu/books/mechanizing-proof).

If you have other relevant publications or academic papers related to application of formal verification (or formal methods, etc) to financial markets, please create a PR.


## License

Apache 2.0