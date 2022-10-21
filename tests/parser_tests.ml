open Full_messages

let test_0 =
  ( "8=FIX.4.2|9=163|35=D|49=BLP|56=RJCO|34=1575|52=20200401-13:05:28|50=7898513|115=24X|60=20200401-13:05:28|1=24XCARE|38=1|40=2|11=20200401-00001-00001|44=172|21=3|54=1|55=RXM0|59=0|10=149|",
    {
      msg_tag = "D";
      payload =
        [
          "60", "20200401-13:05:28";
          "1", "24XCARE";
          "38", "1";
          "40", "2";
          "11", "20200401-00001-00001";
          "44", "172";
          "21", "3";
          "54", "1";
          "55", "RXM0";
          "59", "0";
        ];
    } )

let test_1 =
  ( "8=FIX.4.2|9=163|35=D|49=BLP|56=RJCO|34=1575|52=20200401-13:05:28|50=7898513|115=24X|60=20200401-13:05:28|1=24XCARE|38=1|40=2|11=20200401-00001-00001|44=172|21=3|54=1|55=RXM0|59=0|10=149|",
    {
      msg_tag = "D";
      payload =
        [
          "60", "20200401-13:05:28";
          "1", "24XCARE";
          "38", "1";
          "40", "2";
          "11", "20200401-00001-00001";
          "44", "172";
          "21", "3";
          "54", "1";
          "55", "RXM0";
          "59", "0";
        ];
    } )

let tests = [test_0;test_1];;
