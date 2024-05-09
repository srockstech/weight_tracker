import 'package:get_it/get_it.dart';
import 'package:weight_tracker/services/hive_localdb.dart';
import 'package:weight_tracker/view_model/progress_view_model.dart';
import 'package:weight_tracker/view_model/weight_view_model.dart';
import 'package:weight_tracker/view_model/welcome_view_model.dart';

GetIt locator = GetIt.instance;

final HiveLocalDb hiveLocalDb = locator<HiveLocalDb>();

void setupLocator() {
  //view_models
  locator.registerFactory(() => WeightViewModel());
  locator.registerFactory(() => WelcomeViewModel());
  locator.registerFactory(() => ProgressViewModel());

  //services
  locator.registerSingleton(HiveLocalDb());
}
