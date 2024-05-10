import 'package:flutter/cupertino.dart';
import 'package:weight_tracker/enums/view_state.dart';
import 'package:weight_tracker/locator.dart';
import 'package:weight_tracker/model/weight_entry/weight_entry.dart';
import 'base_view_model.dart';

class WeightViewModel extends BaseModel {
  TextEditingController weightController = TextEditingController();

  Future<void> setWeight(double value) async {
    setState(ViewState.busy);
    // add a new entry to the weightEntriesBox and then update the user's weightEntries list
    List<WeightEntry?> weightEntries = hiveLocalDb.getAllWeightEntries();
    WeightEntry newEntry = WeightEntry(
      weight: value,
      dateTime: DateTime.now(),
      id: (weightEntries.isEmpty) ? 0 : weightEntries.last!.id + 1,
    );
    await hiveLocalDb.putWeightEntryInHive(newEntry);
    debugPrint('New weight entry saved in hive');
    await hiveLocalDb.addWeightEntryToCurrentUser(newEntry.id);
    debugPrint('New weight entry added to the current user');
    setState(ViewState.idle);
  }
}
