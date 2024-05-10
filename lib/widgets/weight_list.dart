// List of all the weight entries of the current user displayed in a column
import 'package:flutter/material.dart';

import '../model/weight_entry/weight_entry.dart';

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
          return ListTile(
            title: Text(model[index]!.weight.toString()),
            subtitle: Text(
                "${model[index]!.dateTime!.day.toString()} ${model[index]!.dateTime!.month.toString()},  ${model[index]!.dateTime!.year.toString()}"),
          );
        },
      ),
    );
  }
}
