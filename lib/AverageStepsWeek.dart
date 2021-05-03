import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
class AverageStepsWeek {
  final String week;
  final int steps;
  final charts.Color barColor;


  AverageStepsWeek({
    @required this.week,
    @required this.steps,
    @required this.barColor
  });
}
