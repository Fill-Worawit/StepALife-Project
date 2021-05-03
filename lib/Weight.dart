import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
class Weight {
  final DateTime month;
  final int weight;
  final charts.Color barColor;


  Weight({
    @required this.month,
    @required this.weight,
    @required this.barColor
  });
}
