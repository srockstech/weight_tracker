import 'package:get_it/get_it.dart';
import 'package:weight_tracker/services/hive_localdb.dart';
import 'package:weight_tracker/view_model/edit_weight_entry_model.dart';
import 'package:weight_tracker/view_model/progress_view_model.dart';
import 'package:weight_tracker/view_model/weight_view_model.dart';
import 'package:weight_tracker/view_model/create_user_view_model.dart';

import 'model/user/user.dart';

GetIt locator = GetIt.instance;

final HiveLocalDb hiveLocalDb = locator<HiveLocalDb>();
void setupLocator() {
  //view_models
  locator.registerFactory(() => WeightViewModel());
  locator.registerFactory(() => CreateUserViewModel());
  locator.registerFactory(() => ProgressViewModel());
  locator.registerFactory(() => EditWeightEntryViewModel());

  //services
  locator.registerSingleton(HiveLocalDb());
}
