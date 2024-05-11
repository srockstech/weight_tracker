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
          appBar: AppBar(
            titleSpacing: 0.0,
            title: Text(
              hiveLocalDb.getCurrentUser()!.userName!,
              style: TextStyle(fontWeight: FontWeight.w900),
            ),
            leading: IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                // function to change user
              },
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
              child: Center(
                child: (hiveLocalDb.getCurrentUserWeightEntries().isNotEmpty)
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, WeightScreen.id);
                            },
                            child: Text('Add weight entry'),
                          ),
                          //show the graph of weight changes
                          WeightChart(
                            model: hiveLocalDb.getCurrentUserWeightEntries(),
                          ),
                          Divider(
                            color: Colors.white,
                            thickness: 0.2,
                          ),
                          Text('Your Weight Entries',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontStyle: FontStyle.italic,
                              )),

                          Divider(
                            color: Colors.white,
                            thickness: 0.2,
                          ),
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
