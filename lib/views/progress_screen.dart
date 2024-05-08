// Screen that shows the graph of weight changes and a list of all weight entries.
import 'package:flutter/material.dart';
import 'package:weight_tracker/view_model/progress_view_model.dart';
import 'package:weight_tracker/widgets/weight_chart.dart';
import 'package:weight_tracker/widgets/weight_list.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Your Progress',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 20),
              // show the line chart
              WeightChart(),
              SizedBox(height: 20),
              // show the list of weight entries
              WeightList(),
            ],
          ),
        ),
      ),
    );
  }
}
