import 'package:get_it/get_it.dart';
import 'package:weight_tracker/view_model/weight_view_model.dart';

GetIt locator = GetIt.instance;
final weightViewModel = locator<WeightViewModel>();

void setupLocator() {
  //view_models
  locator.registerSingleton(WeightViewModel());
}
