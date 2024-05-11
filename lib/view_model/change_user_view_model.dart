import 'package:flutter/material.dart';
import 'package:weight_tracker/enums/view_state.dart';
import 'package:weight_tracker/locator.dart';
import '../model/user/user.dart';
import 'base_view_model.dart';

class ChangeUserViewModel extends BaseModel {
  Future<void> changeCurrentUser(int index) async {
    setState(ViewState.busy);
    await hiveLocalDb.changeCurrentUser(index);
    debugPrint('User changed to ${hiveLocalDb.getAllUsers()[index]!.userName}');
    setState(ViewState.idle);
  }
}
