import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
class AverageStepsMonth {
  final DateTime month;
  final int steps;
  final charts.Color barColor;


  AverageStepsMonth({
    @required this.month,
    @required this.steps,
    @required this.barColor
  });
}
