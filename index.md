---
title: "Introduction"
excerpt: ""
layout: page
---
Development of the FIX Engine model began at Aesthetic Integration (AI) as part of the [Imandra Markets](https://m.imandra.ai) product. The model consists of an executable formalisation of an administrative-level FIX engine, a sample application-level model and a set of verified precise statements about the engine's behaviour. The properties we verify are derived from the English prose specification published by the FIX Community.

There's an explicit interface between administrative and application models to make it easier to generate the application-level logic from a higher-level language (e.g., AI's Imandra Protocol Language or FIX Orchestra).

We hope this project will be the beginning of an industry-wide effort to mathematically formalise the rules and algorithms that run the financial markets. This formalisation will significantly benefit the industry, cutting down time and costs for connecting (and ensuring regulatory compliance of) the numerous systems relying on this protocol.

## Why

Having a complete formal model of the FIX protocol brings many benefits. To name a few:

- Consensus: With the formal model, the industry has a precise, unambiguous foundation for describing, evaluating and  improving the definitions and mechanics of the protocol.

- Queryable: A formal verification engine like Imandra can be used to ask and answer deep questions about the behaviour of the model automatically.

- Testing: Powerful model-based testing techniques can be used to automatically generate high coverage test suites (see [Test Suite]({{ site.baseurl }}/testSuite/#currentTestPack) section below).

- Executable: Outside of the Imandra-specific commands used in verification, the model itself is all valid OCaml code. You may use the full OCaml stack to compile and run the engine.

- Exportable: Using the OCaml stack, the model can be compiled into a number of target languages and library formats. The community can use the verified model to generate source code in other languages (e.g. C++ or Java) targeting specific proprietary (or open source) libraries.

- Simulation: The model can be used as the basis of simulation environments, using the verified engine as a semantic "gold-standard" and test oracle.

## How

The model is written in two languages: OCaml and IML. OCaml is a functional language that is gaining tremendous momentum within the financial services industry. For more information, please see www.ocaml.org. For example, Jane Street a well-known market participant is a strong supporter of the language, with an active [blog](https://blogs.janestreet.com/category/ocaml/).

IML stands for Imandra Modelling Language - it is a pure subset of OCaml for which AI has developed a mechanised formal semantics. This means that everything written in IML can be given a precise axiomatic (i.e., mathematical) representation, and Imandra can then be used to analyze and answer deep questions about the code. Although Imandra is proprietary and requires a license to use, OCaml is open source and there are a number of open source theorem provers which may be adapted to reason about this model. 

## What

The model is currently targeting version 4.4 of the FIX protocol. Over time, we plan to cover other relevant versions. View the technical documentation for further information.

Check out the [References]({{ site.baseurl }}/references/) section for more.

