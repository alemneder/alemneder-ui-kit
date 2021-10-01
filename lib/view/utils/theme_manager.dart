import 'package:flutter/material.dart';
import '../../core/constants/app_data.dart';
import '../../core/utils/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeType { DARK, LIGHT }

class ThemeManager with ChangeNotifier {
  AppData _appData = locator.get<AppData>();

  ThemeManager() {
    getTheme().then((type){
      _appData.usingDarkTheme = type == ThemeType.DARK;
      notifyListeners();
    });
  }

  ThemeType get theme => _appData.usingDarkTheme ? ThemeType.DARK : ThemeType.LIGHT;
  set theme(ThemeType type) => setTheme(type);

  void setTheme(ThemeType type) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _appData.usingDarkTheme = type == ThemeType.DARK;
    bool status = await preferences.setBool('isDarkTheme', _appData.usingDarkTheme);
    if(status) notifyListeners();
  }

  Future<ThemeType> getTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _appData.usingDarkTheme = preferences.getBool('isDarkTheme') ?? false;
    return _appData.usingDarkTheme ? ThemeType.DARK : ThemeType.LIGHT;
  }
}
