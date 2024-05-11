// Screen that accepts a new username and creates a new user profile.
import 'package:flutter/material.dart';
import 'package:weight_tracker/views/progress_screen.dart';
import 'package:weight_tracker/views/weight_screen.dart';
import 'package:weight_tracker/view_model/create_user_view_model.dart';
import 'base_view.dart';

class CreateUserScreen extends StatefulWidget {
  static const String id = 'create_user_screen';
  const CreateUserScreen({super.key});

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<CreateUserViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Center(
              // let users create a profile
              // collect username
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'WeightTracker',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Arial',
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Create a profile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 20),
                  // text field with rectangular border to collect username
                  TextField(
                    controller: model.userNameController,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20),
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      model.userNameController.text =
                          model.userNameController.text.trim();

                      if (model.userNameController.text.length < 3) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              'Username must be at least 3 characters long'),
                        ));
                        return;
                      }

                      if (model.userExists()) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('User already exists'),
                        ));
                        return;
                      }

                      int newUsersIndex = await model.createUser();
                      await model.setNewUserToCurrentUser(newUsersIndex);
                      Navigator.pushNamedAndRemoveUntil(
                          context, ProgressScreen.id, (route) => false);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Create Profile',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
