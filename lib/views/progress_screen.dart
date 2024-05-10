// Screen that shows the graph of weight changes and a list of all weight entries.
import 'package:flutter/material.dart';
import 'package:weight_tracker/locator.dart';
import 'package:weight_tracker/view_model/progress_view_model.dart';
import 'package:weight_tracker/views/weight_screen.dart';
import 'package:weight_tracker/widgets/weight_chart.dart';
import 'package:weight_tracker/widgets/weight_list.dart';

import 'base_view.dart';

class ProgressScreen extends StatefulWidget {
  static const String id = 'progress_screen';
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<ProgressViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Center(
                child: (hiveLocalDb.getCurrentUserWeightEntries().isNotEmpty)
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
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
                          //show the graph of weight changes
                          WeightChart(
                            model: hiveLocalDb.getCurrentUserWeightEntries(),
                          ),
                          SizedBox(height: 20),
                          // show the list of weight entries
                          WeightList(
                            model: hiveLocalDb.getCurrentUserWeightEntries(),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'No weight entries yet',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, WeightScreen.id);
                            },
                            child: Text('Add weight entry'),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        );
      },
    );
  }
}
