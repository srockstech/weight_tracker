import 'package:flutter/cupertino.dart';
import 'package:weight_tracker/enums/view_state.dart';
import 'package:weight_tracker/locator.dart';
import 'package:weight_tracker/model/weight_entry/weight_entry.dart';
import 'base_view_model.dart';

class EditWeightEntryViewModel extends BaseModel {
  TextEditingController weightController = TextEditingController();

  Future<void> editWeightEntry(double value, int entryId) async {
    setState(ViewState.busy);
    // add a new entry to the weightEntriesBox and then update the user's weightEntries list
    List<WeightEntry?> weightEntries = hiveLocalDb.getAllWeightEntries();
    WeightEntry editedEntry = WeightEntry(
      weight: value,
      dateTime: DateTime.now(),
      id: entryId,
    );
    await hiveLocalDb.putWeightEntryInHive(editedEntry);
    debugPrint('Edited entry saved in hive');
    setState(ViewState.idle);
  }

  // function to delete a weight entry
  Future<void> deleteWeightEntry(int entryId) async {
    setState(ViewState.busy);
    await hiveLocalDb.deleteWeightEntry(entryId);
    debugPrint('Entry deleted from user\'s weight entry list');

    setState(ViewState.idle);
  }
}
