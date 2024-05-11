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

  // functon to get all users from the users box
  List<User?> getAllUsers() {
    return usersBox.values.toList();
  }

  Future<void> putWeightEntryInHive(WeightEntry? weightEntry) async {
    if (weightEntriesBox.containsKey(weightEntry!.id)) {
      await weightEntriesBox.delete(weightEntry.id);
    }
    await weightEntriesBox.put(weightEntry.id, weightEntry);
  }

  // function to delete a weight entry
  Future<void> deleteWeightEntry(int entryId) async {
    await weightEntriesBox.delete(entryId);
    //delete the entry from the user's weightEntries list
    User currentUser = usersBox.values.toList().first!;
    currentUser.weightEntries!.remove(entryId);
    await saveUserInHive(currentUser);
  }

  // function to get all weight entries from the weightEntries box
  List<WeightEntry?> getAllWeightEntries() {
    return weightEntriesBox.values.toList();
  }

  // function to update the user's weight entries list
  Future<void> addWeightEntryToCurrentUser(int entryId) async {
    List<int>? currentUserWeightEntries;
    if (usersBox.values.toList().first!.weightEntries == null) {
      currentUserWeightEntries = [entryId];
    } else {
      currentUserWeightEntries = usersBox.values.toList().first!.weightEntries;
      currentUserWeightEntries!.add(entryId);
    }
    User currentUser = usersBox.values.toList().first!;
    currentUser.weightEntries = currentUserWeightEntries;
    await saveUserInHive(currentUser);
  }

  List<WeightEntry?> getCurrentUserWeightEntries() {
    List<int>? userWeightEntries =
        usersBox.values.toList().first!.weightEntries;
    if (userWeightEntries == null) return [];
    // for each value in the userWeightEntries list, get the weight entry from the weightEntriesBox and add it to the list
    List<WeightEntry?> currentUserWeightEntries = userWeightEntries
        .map((entryId) => weightEntriesBox.get(entryId))
        .toList();
    return currentUserWeightEntries;
  }

  // get current user
  User? getCurrentUser() {
    return usersBox.values.toList().first;
  }

  Future<void> closeBoxes() async {
    await weightEntriesBox.close();
    await usersBox.close();
  }
}
