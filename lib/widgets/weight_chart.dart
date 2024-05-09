// Chart that shows the weight of the user over time

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:weight_tracker/model/weight_entry.dart';
import 'package:weight_tracker/view_model/weight_view_model.dart';

class WeightChart extends StatelessWidget {
  final WeightEntry model;

  const WeightChart({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: model.spots,
            isCurved: true,
            color: Colors.blue,
            barWidth: 4,
            isStrokeCapRound: true,
            belowBarData: BarAreaData(show: false),
          ),
        ],
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            drawBelowEverything: true,
            axisNameWidget: Text(
              'Weight (Kg)',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            axisNameSize: 16,
            sideTitles: SideTitles(
              showTitles: true,
              interval: 5,
              reservedSize: 30,
            ),
          ),
          bottomTitles: AxisTitles(
            axisNameSize: 16,
            axisNameWidget: Text(
              'Date',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            drawBelowEverything: true,
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
            ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(
            color: const Color(0xff37434d),
            width: 1,
          ),
        ),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          drawHorizontalLine: true,
          getDrawingHorizontalLine: (value) => FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          ),
          getDrawingVerticalLine: (value) => FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          ),
        ),
      ),
    );
  }
}
