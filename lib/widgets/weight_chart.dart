// Chart that shows the weight of the user over time

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:weight_tracker/model/weight_entry/weight_entry.dart';

class WeightChart extends StatelessWidget {
  final List<WeightEntry?> model;

  const WeightChart({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 5.0, right: 40, top: 20, bottom: 15),
        child: LineChart(
          LineChartData(
            lineBarsData: [
              LineChartBarData(
                spots: model
                    .map(
                      (e) => FlSpot(
                        model.indexOf(e).toDouble(),
                        e!.weight!,
                      ),
                    )
                    .toList(),
                isCurved: true,
                color: Colors.blue,
                barWidth: 4,
                isStrokeCapRound: true,
                belowBarData: BarAreaData(
                  show: true,
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.blue.withOpacity(0.1)],
                    stops: [0.1, 0.8],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ],
            titlesData: FlTitlesData(
              leftTitles: AxisTitles(
                drawBelowEverything: true,
                axisNameWidget: Text(
                  'Weight (Kg)',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                axisNameSize: 25,
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, axis) {
                    return Text(
                      value.toInt().toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    );
                  },
                  interval: 4,
                  reservedSize: 20,
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),
              bottomTitles: AxisTitles(
                axisNameSize: 19,
                axisNameWidget: Text(
                  'Entries',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                drawBelowEverything: true,
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, axis) {
                    return Text(
                      value.toInt().toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    );
                  },
                  reservedSize: 20,
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
              show: false,
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
        ),
      ),
    );
  }
}
