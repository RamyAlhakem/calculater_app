import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String finalresult = '0';
  String result = '';
  String memory = '0';
  double num1 = 0;
  double num2 = 0;
  String opr = '';
  String preopr = '';
  btnpress(String txtbtn) {
    if (txtbtn == 'C') {
      result = '0';
      finalresult = '0';
      memory = '0';
      num1 = 0;
      num2 = 0;
      opr = '';
      preopr = '';
    } else if (txtbtn == '.') {
      if (result.contains('.')) {
      } else {
        result = result + txtbtn;
      }
    } else if (txtbtn == '%') {
      if (num1 != 0) {
        if (opr == '+') {
          num1 = num1 + double.parse(finalresult) / 100;
        } else if (opr == '-') {
          num1 = num1 - double.parse(finalresult) / 100;
        } else if (opr == 'X') {
          num1 = num1 * double.parse(finalresult) / 100;
        } else if (opr == '/') {
          num1 = num1 / double.parse(finalresult) / 100;
        }
      } else {
        num1 = double.parse(finalresult);
        num1 = num1 / 100;
      }
      opr = txtbtn;
      memory = num1.toString();
      memory += txtbtn;
      result = '0';
    } else if (txtbtn == '=') {
      if (num1 == 0 && finalresult == "0") {
      } else {
        num2 = double.parse(finalresult);
        memory += num2.toString();
        if (opr == '+') {
          result = (num1 + num2).toString();
        } else if (opr == '-') {
          result = (num1 - num2).toString();
        } else if (opr == 'X') {
          result = (num1 * num2).toString();
        } else if (opr == '/') {
          result = (num1 / num2).toString();
        }

        num1 = 0;
        num2 = 0;
      }
    } else if (txtbtn == '+' ||
        txtbtn == '-' ||
        txtbtn == 'X' ||
        txtbtn == '/') {
      if (num1 != 0) {
        if (opr == '+') {
          num1 = num1 + double.parse(finalresult);
        } else if (opr == '-') {
          num1 = num1 - double.parse(finalresult);
        } else if (opr == 'X') {
          num1 = num1 * double.parse(finalresult);
        } else if (opr == '/') {
          num1 = num1 / double.parse(finalresult);
        }
      } else {
        num1 = double.parse(finalresult);
      }
      opr = txtbtn;
      memory = num1.toString();
      memory += txtbtn;
      result = '0';
    } else if (txtbtn == 'Del') {
      result = result.substring(0, result.length - 1);
      if (result == "") {
        result = '0';
      }
    } else {
      if (finalresult == '0') {
        result = txtbtn;
      } else {
        result = finalresult + txtbtn;
      }
    }
  }

  ElevatedButton calculatbtn(
      String txtbtn, Color btncolor, double sizebtn, double sizepad) {
    return ElevatedButton(
      onPressed: () {
        btnpress(txtbtn);
        setState(() {
          finalresult = result;
        });
      },
      child: Text(txtbtn),
      style: ElevatedButton.styleFrom(
          primary: btncolor,
          onPrimary: Colors.white,
          padding: EdgeInsets.all(sizepad),
          textStyle: TextStyle(fontSize: sizebtn),
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 0.5, color: Colors.black))),
    );
  }

  GlobalKey<ScaffoldState> scafoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    final islandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      key: scafoldkey,
      backgroundColor: Color.fromARGB(255, 80, 76, 76),
      appBar: AppBar(
        title: const Text('Calculator'),
        centerTitle: true,
        backgroundColor: Colors.grey,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.pink,
        ),
      ),
      body: islandscape
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'images/aw.png',
                  width: screenheight / 1.1,
                ),
                Container(
                  width: screenheight,
                  height: screenwidth,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          alignment: Alignment.centerRight,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              memory,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 5, bottom: 5),
                          alignment: Alignment.centerRight,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              finalresult,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.lightBlue),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: calculatbtn('7', Colors.grey, 15, 15)),
                            Expanded(
                                child: calculatbtn('8', Colors.grey, 15, 15)),
                            Expanded(
                                child: calculatbtn('9', Colors.grey, 15, 15)),
                            Expanded(
                                flex: 2,
                                child: calculatbtn(
                                    '+', Colors.orangeAccent, 15, 15))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: calculatbtn('4', Colors.grey, 15, 15)),
                            Expanded(
                                child: calculatbtn('5', Colors.grey, 15, 15)),
                            Expanded(
                                child: calculatbtn('6', Colors.grey, 15, 15)),
                            Expanded(
                                flex: 2,
                                child: calculatbtn(
                                    '-', Colors.orangeAccent, 15, 15))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: calculatbtn('1', Colors.grey, 15, 15)),
                            Expanded(
                                child: calculatbtn('2', Colors.grey, 15, 15)),
                            Expanded(
                                child: calculatbtn('3', Colors.grey, 15, 15)),
                            Expanded(
                                flex: 2,
                                child: calculatbtn(
                                    'X', Colors.orangeAccent, 15, 15))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: calculatbtn('%', Colors.grey, 15, 15)),
                            Expanded(
                                child: calculatbtn('0', Colors.grey, 15, 15)),
                            Expanded(
                                child: calculatbtn('.', Colors.grey, 15, 15)),
                            Expanded(
                                flex: 2,
                                child: calculatbtn(
                                    '/', Colors.orangeAccent, 15, 15))
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child:
                                    calculatbtn('C', Colors.lightBlue, 15, 15)),
                            Expanded(
                                child: calculatbtn('Del', Colors.red, 15, 15)),
                            Expanded(
                                flex: 2,
                                child: calculatbtn(
                                    '=', Colors.orangeAccent, 15, 15))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          : Container(
              width: screenwidth,
              height: screenheight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.centerRight,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        memory,
                        style: const TextStyle(
                            fontSize: 28,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 10, bottom: 10),
                    alignment: Alignment.centerRight,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        finalresult,
                        style: const TextStyle(
                            fontSize: 28, color: Colors.lightBlue),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(child: calculatbtn('7', Colors.grey, 27, 20)),
                      Expanded(child: calculatbtn('8', Colors.grey, 27, 20)),
                      Expanded(child: calculatbtn('9', Colors.grey, 27, 20)),
                      Expanded(
                          flex: 2,
                          child: calculatbtn('+', Colors.orangeAccent, 27, 20))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: calculatbtn('4', Colors.grey, 27, 20)),
                      Expanded(child: calculatbtn('5', Colors.grey, 27, 20)),
                      Expanded(child: calculatbtn('6', Colors.grey, 27, 20)),
                      Expanded(
                          flex: 2,
                          child: calculatbtn('-', Colors.orangeAccent, 27, 20))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: calculatbtn('1', Colors.grey, 27, 20)),
                      Expanded(child: calculatbtn('2', Colors.grey, 27, 20)),
                      Expanded(child: calculatbtn('3', Colors.grey, 27, 20)),
                      Expanded(
                          flex: 2,
                          child: calculatbtn('X', Colors.orangeAccent, 27, 20))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: calculatbtn('%', Colors.grey, 27, 20)),
                      Expanded(child: calculatbtn('0', Colors.grey, 27, 20)),
                      Expanded(child: calculatbtn('.', Colors.grey, 27, 20)),
                      Expanded(
                          flex: 2,
                          child: calculatbtn('/', Colors.orangeAccent, 27, 20))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: calculatbtn('C', Colors.lightBlue, 27, 20)),
                      Expanded(child: calculatbtn('Del', Colors.red, 27, 20)),
                      Expanded(
                          flex: 2,
                          child: calculatbtn('=', Colors.orangeAccent, 27, 20))
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
