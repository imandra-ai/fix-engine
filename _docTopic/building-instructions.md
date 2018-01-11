---
title: "Building Instructions"
tag: buildingInstructions
sequence: 2
---
### Building with OCaml

We use the following versions of the compiler/packages in order to build the `fix-engine` code with OCaml: 

    OCaml version 4.01.0
    lwt=2.6.0
    yojson=1.3
    topkg=0.9
    topkg-care=0.9

Currently, the  `fix-engine` repository contains two sets of application level messages: the folders `src-protocol-exts` and `src-protocol-exts-pp` are DSL-generated and contain all the application-level FIX messages that are present in the FIX specification. Folders `src-protocol-exts-vg` and `src-protocol-exts-pp-vg` are hand-written and contain a small subset of FIX messages -- those are used in VGs and examples.  

In order to build the code with the "full" set of messages, just type `make`. To build with "VGs-compatible" messages, do `make build_vgs`.
### Testing with quickfixj/banzai client

The sever executable is built only with the "full" message set. You can start the server with

     make run_server

The server is listening on port 9880 in the acceptor mode, the default `SenderCompID` value is `IMANDRA` and the default value for `TargetCompID` is `BANZAI`.

One can test the server with a "banzai" example client from the QuickfixJ software. Here's how to checkout and build the QuickfixJ code 

{% highlight %}
    git clone https://github.com/quickfix-j/quickfixj.git
    cd quickfixj/
    git checkout QFJ_1_6_x
    vim quickfixj-examples/banzai/src/main/resources/quickfix/examples/banzai/banzai.cfg
{% endhighlight %}

Edit the banzai.cfg file, so it looks like this:

    [default]
    FileStorePath=target/data/banzai
    ConnectionType=initiator
    SenderCompID=BANZAI
    TargetCompID=IMANDRA
    SocketConnectHost=localhost
    StartTime=00:00:00
    EndTime=00:00:00
    HeartBtInt=30
    ReconnectInterval=60

    [session]
    BeginString=FIX.4.4
    SocketConnectPort=9880

We build the code with maven (running the test suite takes a lot of time, so we skip it):

    mvn install -DskipTests  

Finally, we can start the client with:

    java -jar quickfixj-examples/banzai/target/quickfixj-examples-banzai-1.6.4-SNAPSHOT-standalone.jar