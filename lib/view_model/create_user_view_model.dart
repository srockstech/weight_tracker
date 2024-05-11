// view model for the welcome screen

import 'package:flutter/material.dart';
import 'package:weight_tracker/enums/view_state.dart';
import 'package:weight_tracker/locator.dart';
import '../model/user/user.dart';
import 'base_view_model.dart';

class CreateUserViewModel extends BaseModel {
  TextEditingController userNameController = TextEditingController();

  Future<int> createUser() async {
    setState(ViewState.busy);
    List<User?> users = hiveLocalDb.getAllUsers();
    int newIndex = (users.isEmpty) ? 0 : users.last!.id + 1;
    User newUser = User(
      userName: userNameController.text,
      id: newIndex,
    );
    await hiveLocalDb.saveUserInHive(newUser);
    debugPrint('New user saved in hive');
    setState(ViewState.idle);
    return newIndex;
  }

  Future<void> setNewUserToCurrentUser(int index) async {
    setState(ViewState.busy);
    await hiveLocalDb.changeCurrentUser(index);
    debugPrint('User changed to ${hiveLocalDb.getAllUsers()[index]!.userName}');
    setState(ViewState.idle);
  }

  bool userExists() {
    List<User?> users = hiveLocalDb.getAllUsers();
    for (User? user in users) {
      if (user!.userName == userNameController.text) {
        return true;
      }
    }
    return false;
  }
}
