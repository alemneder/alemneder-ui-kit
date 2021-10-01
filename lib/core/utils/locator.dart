import 'package:get_it/get_it.dart';
import '../constants/app_data.dart';

GetIt locator = GetIt.I;

void setupLocator() async {
  locator.registerLazySingleton(() => AppData());
}
