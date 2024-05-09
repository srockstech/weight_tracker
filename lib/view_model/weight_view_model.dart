import 'package:flutter/material.dart';
import 'package:weight_tracker/enums/view_state.dart';
import 'base_view_model.dart';

class WeightViewModel extends BaseModel {
  double _weight = 0.0;

  double get weight => _weight;

  void setWeight(double value) {
    setState(ViewState.busy);
    _weight = value;
    setState(ViewState.idle);
  }
}
