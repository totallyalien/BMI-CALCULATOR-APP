import 'package:flutter/material.dart';
import 'calculator_brain.dart';

class OutPage extends StatefulWidget {
  const OutPage(@required this.bmi, @required this.result, @required this.inter,
      {super.key});
  final int bmi;
  final String result;
  final String inter;

  @override
  State<OutPage> createState() => _OutPageState(bmi, result, inter);
}

class _OutPageState extends State<OutPage> {
  _OutPageState(@required this.bmi_final, @required this.result_final,
      @required this.inter_final);
  final int bmi_final;
  final String result_final;
  final String inter_final;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.purple,
            ),
            margin: EdgeInsets.all(20),
            width: double.infinity,
            height: 100,
            child: Center(
                child: Text("YOUR RESULT",
                    style: TextStyle(fontSize: 20, color: Colors.white)))),
        Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color.fromARGB(255, 255, 254, 250),
              ),
              child: Column(
                children: [
                  Expanded(child: Center(child: Text(result_final))),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Center(
                        child: Text(
                          bmi_final.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 90,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: Center(
                          child: Container(
                    child: Center(
                        child: Text(
                      inter_final,
                      style: TextStyle(fontSize: 15),
                    )),
                    padding: EdgeInsets.all(35),
                  ))),
                ],
              ),
            )),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.purple,
            ),
            width: double.infinity,
            height: 100,
            child: Center(
                child: Text(
              "RE-CALCULATE",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
          ),
        )
      ],
    )));
  }
}
