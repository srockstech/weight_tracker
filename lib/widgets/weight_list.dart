// List of all the weight entries of the current user displayed in a column
import 'package:flutter/material.dart';
import 'package:weight_tracker/views/edit_weight_entry_screen.dart';
import 'package:weight_tracker/views/weight_screen.dart';

import '../model/weight_entry/weight_entry.dart';
import 'package:weight_tracker/constants.dart';

class WeightList extends StatelessWidget {
  final List<WeightEntry?> model;

  const WeightList({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: model.length,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            child: ListTile(
                contentPadding: EdgeInsets.only(left: 15),
                title: Text(model[index]!.weight.toString(),
                    style: TextStyle(color: Colors.white)),
                subtitle: Text(
                    "${model[index]!.dateTime!.day.toString()} ${monthName[model[index]!.dateTime!.month - 1]},  ${model[index]!.dateTime!.year.toString()}"),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // edit the weight entry
                    // open the weight screen with the weight entry to edit
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditWeightEntryScreen(weight: model[index]!.weight.toString(), entryId: model[index]!.id),

                      ),
                    );
                  },
                )),
          );
        },
      ),
    );
  }
}
