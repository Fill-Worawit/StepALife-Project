import 'package:flutter/material.dart';
import 'package:project_new/report.dart';
import 'WeightChart.dart';
import 'Weight.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'user.dart';
import 'mainpage.dart';

class Health extends StatelessWidget {

  List<user> currentUsers;
  Health({Key key, this.currentUsers}) : super(key: key);

  @override
  final List<Weight> weightData = [
    Weight(
      month: new DateTime(2020, 1, 6),
      weight: 45,
      barColor: charts.ColorUtil.fromDartColor(Colors.brown),
    ),
    Weight(
      month: new DateTime(2021, 1, 16),
      weight: 80,
      barColor: charts.ColorUtil.fromDartColor(Colors.brown),
    ),
    Weight(
      month: new DateTime(2021, 2, 16),
      weight: 86,
      barColor: charts.ColorUtil.fromDartColor(Colors.brown),
    ),
    Weight(
      month: new DateTime(2021, 3, 16),
      weight: 85,
      barColor: charts.ColorUtil.fromDartColor(Colors.brown),
    ),
    Weight(
      month: new DateTime(2021, 4, 16),
      weight: 81,
      barColor: charts.ColorUtil.fromDartColor(Colors.brown),
    ),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(currentUsers: currentUsers),
        ),
      ); // button press
                  }, // button press
                  child: Text(
                    "TODAY",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.brown,
                        height: 1.5,
                        fontFamily: 'Open Sans'),
                  ),
                ),
                Container(
                  width: 28,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReportPage(currentUsers: currentUsers),
                      ),
                    );},
                  child: Text(
                    "REPORT",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                ),
                Container(
                  width: 28,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ReportPage(currentUsers: currentUsers)));
                  },
                  child: Text(
                    "HEALTH",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(hexColor("F6EBE0")),
          elevation: 0.0,
        ),
        body: Container(
          decoration: BoxDecoration(color: Color(hexColor("F6EBE0"))),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Text(
                  'Today Drink:',
                  style: TextStyle(
                      height: 0.50,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Row(
                children: [
                  Container(
                    child: IconButton(
                      icon: Image.asset('assets/image/glass-removebg.png'),
                      iconSize: 60,
                      onPressed: () {},
                      alignment: Alignment.topRight,
                    ),
                  ),
                  Container(
                      child: IconButton(
                    icon: Image.asset('assets/image/glass-removebg.png'),
                    iconSize: 60,
                    onPressed: () {},
                    alignment: Alignment.topRight,
                  ))
                ],
              ),
              Text(
                'Weight Per Month',
                style: TextStyle(
                    height: 0.50,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5, 2, 5, 1),
                  child: WeightChart(data: weightData),
                ),
              )
            ],
          ),
        ));
  }
}

int hexColor(String colorCode) {
  String colorstr = '0xff' + colorCode;
  int colorint = int.parse(colorstr);
  return colorint;
}
