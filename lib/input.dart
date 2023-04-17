import 'package:flutter/material.dart';
import 'package:flutter_animated_icons/flutter_animated_icons.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:flutter_animated_icons/lottiefiles.dart';
import 'custom.dart';
import 'output.dart';
import 'calculator_brain.dart';

Color KcontColor = Color.fromARGB(255, 247, 245, 245);
Color selectedMark = Colors.purple;

enum Gender { Male, Female }

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Color Male_select = KcontColor;
  Color Female_select = KcontColor;
  Values weight_value = Values(60);
  Values height_value = Values(180);
  Values age_value = Values(18);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 170,
          title: Center(
              child: Text(
            "BMI",
            style: TextStyle(fontSize: 40),
          )),
        ),
        body: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: cardnew(Male_select,
                        childwidget: icon_text(Icons.male, "MALE"),
                        cardname: Gender.Male)),
                Expanded(
                    child: cardnew(Female_select,
                        childwidget: icon_text(Icons.female, "FEMALE"),
                        cardname: Gender.Female))
              ],
            )),
            Expanded(
                child: cardnew(KcontColor,
                    childwidget: Column(
                      children: [
                        Text("HEIGHT"),
                        SizedBox(height: 7),
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              height_value.data.toString(),
                              style: TextStyle(fontSize: 30),
                            ),
                            Text("CM")
                          ],
                        ),
                        Slider(
                          value: height_value.data.toDouble(),
                          onChanged: (value) {
                            print(value.round());
                            setState(() {
                              height_value.data = value.toInt();
                            });
                          },
                          min: 80.00,
                          max: 220.00,
                          activeColor: Colors.purple,
                        )
                      ],
                    ))),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: cardnew(KcontColor,
                      childwidget: Column(
                        children: [
                          Text("WEIGHT"),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                weight_value.data.toString(),
                                style: TextStyle(fontSize: 20),
                              ),
                              Text("KG")
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              roundedbutton(
                                Icons.add,
                                fun: weight_value.increase,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              roundedbutton(Icons.remove,
                                  fun: weight_value.decrease)
                            ],
                          )
                        ],
                      )),
                ),
                Expanded(
                    child: cardnew(KcontColor,
                        childwidget: Column(
                          children: [
                            Text("AGE"),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              textBaseline: TextBaseline.alphabetic,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              children: [
                                Text(
                                  age_value.data.toString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text("YRS")
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                roundedbutton(Icons.add,
                                    fun: age_value.increase),
                                SizedBox(
                                  width: 5,
                                ),
                                roundedbutton(Icons.remove,
                                    fun: age_value.decrease)
                              ],
                            )
                          ],
                        )))
              ],
            )),
            Expanded(
                child: TextButton(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Center(
                          child: Text(
                        "CALCULATE",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                    onPressed: () {
                      calculatorBrain cal =
                          calculatorBrain(height_value.data, weight_value.data);

                      cal.calculate();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return OutPage(
                              cal.bmi, cal.getResult(), cal.getInter());
                        }),
                      );
                    }))
          ],
        ),
      ),
    );
  }

  GestureDetector roundedbutton(icon_name, {fun}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          fun();
        });
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(
            icon_name,
            size: 30,
            color: Colors.white,
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.all(Radius.circular(30))),
      ),
    );
  }

  Padding icon_text(icon_name, text_name) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(
        child: Column(
          children: [
            Icon(
              icon_name,
              size: 40,
            ),
            SizedBox(height: 10),
            Text(text_name)
          ],
        ),
      ),
    );
  }

  GestureDetector cardnew(@required Color, {childwidget, cardname}) {
    return GestureDetector(
      onTap: () {
        if (cardname == Gender.Male) {
          setState(() {
            Male_select = selectedMark;
            Female_select = KcontColor;
          });
        } else if (cardname == Gender.Female) {
          setState(() {
            Female_select = selectedMark;
            Male_select = KcontColor;
          });
        }
      },
      child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(child: childwidget),
          )),
    );
  }
}
