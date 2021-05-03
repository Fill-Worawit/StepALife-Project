import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'AverageStepsMonth.dart';

class AverageStepsChartMonth extends StatelessWidget {
  final List<AverageStepsMonth> data;

  AverageStepsChartMonth({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<AverageStepsMonth, DateTime>> series = [
      charts.Series(
          id: "month",
          data: data,
          domainFn: (AverageStepsMonth series, _) => series.month,
          measureFn: (AverageStepsMonth series, _) => series.steps,
          colorFn: (AverageStepsMonth series, _) => series.barColor)
    ];
    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Column(
          children: <Widget>[
            Text("Average steps (last 5 months)",
                style: Theme
                    .of(context)
                    .textTheme
                    .body2),
            Expanded(child: charts.TimeSeriesChart(series, animate: true))
          ],
        ),
      ),
    );
  }
}
