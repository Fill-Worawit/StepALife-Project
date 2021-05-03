import 'package:flutter/material.dart';
import 'AverageStepsMonth.dart';
import 'AverageStepsWeek.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'AverageStepsChartWeek.dart';
import 'AverageStepChartMonth.dart';
import 'Health.dart';
import 'user.dart';
import 'mainpage.dart';

class ReportPage extends StatelessWidget {

  final List<user> currentUsers;
  ReportPage({Key key, this.currentUsers}) : super(key: key);

  int hexColor(String colorCode) {
    String colorstr = '0xff' + colorCode;
    int colorint = int.parse(colorstr);
    return colorint;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Row(
            children: [
              TextButton(
                onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(currentUsers: currentUsers),
                  ),
                );}, // button press
                child: Text(
                  "TODAY",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey,
                      height: 1.5,
                      fontFamily: 'Open Sans'),
                ),
              ),
              Container(
                width: 28,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "REPORT",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(hexColor("8B5B21")),
                    height: 1.5,
                  ),
                ),
              ),
              Container(
                width: 28,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Health(currentUsers: currentUsers),
                  ));},
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
      body: ReportMain(),
    );
  }
}

class ReportMain extends StatelessWidget {

  int hexColor(String colorCode) {
    String colorstr = '0xff' + colorCode;
    int colorint = int.parse(colorstr);
    return colorint;
  }

  // data for average steps week
  final List<AverageStepsWeek> weekData = [
    AverageStepsWeek(
      week: "Sun",
      steps: 3500,
      barColor: charts.ColorUtil.fromDartColor(Colors.brown),
    ),
    AverageStepsWeek(
      week: "Mon",
      steps: 5000,
      barColor: charts.ColorUtil.fromDartColor(Colors.brown),
    ),
    AverageStepsWeek(
      week: "Tue",
      steps: 4500,
      barColor: charts.ColorUtil.fromDartColor(Colors.brown),
    ),
    AverageStepsWeek(
      week: "Wed",
      steps: 6000,
      barColor: charts.ColorUtil.fromDartColor(Colors.brown),
    ),
    AverageStepsWeek(
      week: "Thu",
      steps: 3400,
      barColor: charts.ColorUtil.fromDartColor(Colors.brown),
    ),
    AverageStepsWeek(
      week: "Fri",
      steps: 4700,
      barColor: charts.ColorUtil.fromDartColor(Colors.brown),
    ),
    AverageStepsWeek(
      week: "Today",
      steps: 4500,
      barColor: charts.ColorUtil.fromDartColor(Colors.brown),
    ),
  ];

  // data for average steps month
  final List<AverageStepsMonth> monthData = [
    AverageStepsMonth(
      month: new DateTime(2020, 12, 19),
      steps: 4500,
      barColor: charts.ColorUtil.fromDartColor(Colors.brown),
    ),
    AverageStepsMonth(
      month: new DateTime(2021, 1, 19),
      steps: 6000,
      barColor: charts.ColorUtil.fromDartColor(Colors.brown),
    ),
    AverageStepsMonth(
      month: new DateTime(2021, 2, 19),
      steps: 3400,
      barColor: charts.ColorUtil.fromDartColor(Colors.brown),
    ),
    AverageStepsMonth(
      month: new DateTime(2021, 3, 19),
      steps: 4700,
      barColor: charts.ColorUtil.fromDartColor(Colors.brown),
    ),
    AverageStepsMonth(
      month: new DateTime(2021, 4, 19),
      steps: 4500,
      barColor: charts.ColorUtil.fromDartColor(Colors.brown),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(hexColor("F6EBE0")),
        body: GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      mainAxisSpacing: 4,
      crossAxisCount: 1,
      children: <Widget>[
        AverageStepsChartWeek(data: weekData),
        AverageStepsChartMonth(data: monthData)
      ],
    ));
  }
}
