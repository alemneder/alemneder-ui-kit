import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'core/constants/app_constants.dart';
import 'core/constants/app_data.dart';
import 'core/utils/locator.dart';
import 'view/constants/theme_styles.dart';
import 'view/screens/base/base_screen.dart';
import 'view/utils/theme_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/lang/language_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setupLocator();
  await setupTheme();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      EasyLocalization(
        supportedLocales: LanguageManager.instance!.supportLocales,
        path: AppConstants.LANG_ASSET_PATH,
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<ThemeManager>(
              create: (context) => ThemeManager(),
            ),
          ],
          child: MyApp(),
        ),
      ),
    );
  });
}

Future<void> setupTheme() async {
  var preferences = await SharedPreferences.getInstance();
  var appData = locator.get<AppData>();
  appData.usingDarkTheme = preferences.getBool('isDarkTheme') ?? false;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeManager>(context, listen: true);
    var appData = locator.get<AppData>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reverence',
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      theme: appData.usingDarkTheme
          ? ThemeStyles.darkTheme
          : ThemeStyles.lightTheme,
      home: BaseScreen(),
    );
  }
}
