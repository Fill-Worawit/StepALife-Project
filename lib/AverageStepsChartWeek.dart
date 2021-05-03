import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'AverageStepsWeek.dart';

class AverageStepsChartWeek extends StatelessWidget {
  final List<AverageStepsWeek> data;

  AverageStepsChartWeek({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<AverageStepsWeek, String>> series = [
      charts.Series(
          id: "Subscribers",
          data: data,
          domainFn: (AverageStepsWeek series, _) => series.week,
          measureFn: (AverageStepsWeek series, _) => series.steps,
          colorFn: (AverageStepsWeek series, _) => series.barColor)
    ];
    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Column(
          children: <Widget>[
            Text("Average steps (last week)",
                style: Theme
                    .of(context)
                    .textTheme
                    .body2),
            Expanded(child: charts.BarChart(series, animate: true))
          ],
        ),
      ),
    );
  }
}
