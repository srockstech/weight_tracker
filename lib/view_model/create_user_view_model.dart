// view model for the welcome screen

import 'package:flutter/material.dart';
import 'package:weight_tracker/enums/view_state.dart';
import 'package:weight_tracker/locator.dart';
import '../model/user/user.dart';
import 'base_view_model.dart';

class CreateUserViewModel extends BaseModel {
  TextEditingController userNameController = TextEditingController();

  Future<void> createUser() async {
    setState(ViewState.busy);
    List<User?> users = hiveLocalDb.getAllUsers();
    User newUser = User(
      userName: userNameController.text,
      id: (users.isEmpty) ? 0 : users.last!.id + 1,
    );
    await hiveLocalDb.saveUserInHive(newUser);
    debugPrint('New user saved in hive');
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
