// Screen that records the user's weight.
import 'package:flutter/material.dart';
import 'package:weight_tracker/view_model/weight_view_model.dart';
import 'package:weight_tracker/views/progress_screen.dart';
import 'package:weight_tracker/view_model/base_view_model.dart';

import '../model/weight_entry/weight_entry.dart';
import '../view_model/edit_weight_entry_model.dart';
import 'base_view.dart';

class EditWeightEntryScreen extends StatefulWidget {
  final String weight;
  final int entryId;
  const EditWeightEntryScreen(
      {super.key, required this.weight, required this.entryId});

  @override
  State<EditWeightEntryScreen> createState() => _EditWeightEntryScreenState();
}

class _EditWeightEntryScreenState extends State<EditWeightEntryScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseView<EditWeightEntryViewModel>(
      builder: (context, model, child) {
        model.weightController.text = widget.weight;
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
                    'Edit your weight',
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
                    controller: model.weightController,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Weight (Kg)',
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
                      if (model.weightController.text.isNotEmpty) {
                        await model.editWeightEntry(
                            double.parse(model.weightController.text),
                            widget.entryId);
                        Navigator.pushNamedAndRemoveUntil(
                            context, ProgressScreen.id, (route) => false);
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Save',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () async {
                      await model.deleteWeightEntry(widget.entryId);
                      Navigator.pushNamedAndRemoveUntil(
                          context, ProgressScreen.id, (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      side: BorderSide(color: Colors.red),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'Delete Entry',
                        style: TextStyle(fontSize: 14, color: Colors.red),
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
