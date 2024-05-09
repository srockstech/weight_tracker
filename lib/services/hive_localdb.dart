// local database service using hive for storing user data
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:weight_tracker/model/user/user.dart';
// import path provider to get the app document directory
import 'package:path_provider/path_provider.dart' as path_provider;
import '../model/weight_entry/weight_entry.dart';
import 'package:weight_tracker/locator.dart';

class HiveLocalDb {
  late Box<User?> usersBox;
  late Box<WeightEntry?> weightEntriesBox;

  Future<void> init() async {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive
      ..init(appDocumentDirectory.path)
      ..registerAdapter(UserAdapter())
      ..registerAdapter(WeightEntryAdapter());

    usersBox = await Hive.openBox<User?>('users');
    weightEntriesBox = await Hive.openBox<WeightEntry?>('weight_entries');
  }

  Future<void> saveUserInHive(User? user) async {
    final box = usersBox;
    if (usersBox.containsKey(user!.id)) {
      usersBox.delete(user.id);
    }
    return await box.put(user.id, user);
  }

  Future<void> putWeightEntryInHive(WeightEntry? weightEntry) async {
    if (weightEntriesBox.containsKey(weightEntry!.id)) {
      await weightEntriesBox.delete(weightEntry.id);
    }
    await weightEntriesBox.put(weightEntry.id, weightEntry);
  }

  List<WeightEntry?> getCurrentUserWeightEntries(User? user) {
    List<int>? userWeightEntries = user!.weightEntries;
    // for each value in the userWeightEntries list, get the weight entry from the weightEntriesBox and add it to the list
    List<WeightEntry?> currentUserWeightEntries = userWeightEntries!
        .map((entryId) => weightEntriesBox.get(entryId))
        .toList();
    return currentUserWeightEntries;
  }

  Future<void> closeBoxes() async {
    await weightEntriesBox.close();
    await usersBox.close();
  }
}
