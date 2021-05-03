import 'package:charts_flutter/flutter.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Weight.dart';

class WeightChart extends StatelessWidget {
  final List<Weight> data;

  WeightChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Weight, DateTime>> series = [
      charts.Series(
          id: "month",
          data: data,
          domainFn: (Weight series, _) => series.month,
          measureFn: (Weight series, _) => series.weight,
          colorFn: (Weight series, _) => series.barColor)
    ];
    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Column(
          children: <Widget>[
            Text("Weight Per Month", style: Theme.of(context).textTheme.body2),
            Expanded(child: charts.TimeSeriesChart(series, animate: true))
          ],
        ),
      ),
    );
  }
}
