// Screen that displays all the user profiles and allows the user to select one of them.
import 'package:flutter/material.dart';
import 'package:weight_tracker/locator.dart';
import 'package:weight_tracker/view_model/change_user_view_model.dart';
import 'package:weight_tracker/views/create_user_screen.dart';
import 'package:weight_tracker/views/progress_screen.dart';

import 'base_view.dart';

class ChangeUserScreen extends StatelessWidget {
  static const String id = 'change_user_screen';
  const ChangeUserScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ChangeUserViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text('Select Profile',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 19,
                    color: Colors.white)),
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            titleSpacing: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: hiveLocalDb.getAllUsers().length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          hiveLocalDb.getAllUsers()[index]!.userName!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        onTap: () async {
                          // change the selected users index in the hive local db to 0 and the user that had index 0 to the selected index
                          await model.changeCurrentUser(index);
                          await Navigator.pushNamedAndRemoveUntil(
                              context, ProgressScreen.id, (route) => false);
                        },
                      );
                    },
                  ),
                ),
                // button to create a new user profile
                Flexible(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, CreateUserScreen.id);
                    },
                    child: Text('Create New Profile'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
