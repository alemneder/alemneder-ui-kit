import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/hex_color.dart';

import 'app_colors.dart';

class ThemeStyles {
  // fontStyle.copyWith
  static final TextStyle fontStyle = GoogleFonts.roboto();
  static final TextTheme fontTheme = GoogleFonts.robotoTextTheme();

  // DARK THEME

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: HexColor(AppHexColors.DARK_THEME_BACKGROUND),
    shadowColor: HexColor(AppHexColors.DARK_THEME_LABEL),
    primaryColor: HexColor(AppHexColors.PRIMARY_COLOR),
    focusColor: HexColor(AppHexColors.PRIMARY_COLOR),
    indicatorColor: HexColor(AppHexColors.PRIMARY_COLOR),
        bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: HexColor(AppHexColors.DARK_THEME_LABEL)),
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: HexColor(AppHexColors.PRIMARY_COLOR)),
    appBarTheme: AppBarTheme(
      titleTextStyle: fontStyle.copyWith(
        color: HexColor(AppHexColors.DARK_THEME_TITLE_TEXT),
      ),
      iconTheme:
          IconThemeData(color: HexColor(AppHexColors.DARK_THEME_TITLE_TEXT)),
      actionsIconTheme:
          IconThemeData(color: HexColor(AppHexColors.DARK_THEME_TITLE_TEXT)),
      backgroundColor: HexColor(AppHexColors.DARK_THEME_LAYER),
      foregroundColor: HexColor(AppHexColors.DARK_THEME_TITLE_TEXT),
    ),
    primaryTextTheme: fontTheme.copyWith(
      headline6: fontStyle.copyWith(
        color: HexColor(AppHexColors.DARK_THEME_TITLE_TEXT),
      ),
    ),
    textTheme: fontTheme
        .copyWith(
          bodyText1: fontStyle.copyWith(
            color: HexColor(AppHexColors.DARK_THEME_BODY_TEXT),
          ),
          bodyText2: fontStyle.copyWith(
            color: HexColor(AppHexColors.DARK_THEME_BODY_TEXT),
          ),
          headline1: fontStyle.copyWith(
            color: HexColor(AppHexColors.DARK_THEME_TITLE_TEXT),
          ),
          headline2: fontStyle.copyWith(
            color: HexColor(AppHexColors.DARK_THEME_TITLE_TEXT),
          ),
          headline3: fontStyle.copyWith(
            color: HexColor(AppHexColors.DARK_THEME_TITLE_TEXT),
          ),
          headline4: fontStyle.copyWith(
            color: HexColor(AppHexColors.DARK_THEME_TITLE_TEXT),
            fontWeight: FontWeight.bold
          ),
          headline5: fontStyle.copyWith(
              color: HexColor(AppHexColors.DARK_THEME_TITLE_TEXT),
              fontWeight: FontWeight.bold),
          headline6: fontStyle.copyWith(
              color: HexColor(AppHexColors.DARK_THEME_TITLE_TEXT),
              fontWeight: FontWeight.bold),
        )
        .apply(bodyColor: HexColor(AppHexColors.DARK_THEME_TITLE_TEXT)),
    cardColor: HexColor(AppHexColors.DARK_THEME_LAYER),
    backgroundColor: HexColor(AppHexColors.DARK_THEME_BACKGROUND),
    dialogBackgroundColor: HexColor(AppHexColors.DARK_THEME_LAYER),
  );

  // LIGHT THEME

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: HexColor(AppHexColors.LIGHT_THEME_BACKGROUND),
    primaryColor: HexColor(AppHexColors.PRIMARY_COLOR),
    focusColor: HexColor(AppHexColors.PRIMARY_COLOR),
    indicatorColor: HexColor(AppHexColors.PRIMARY_COLOR),
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: HexColor(AppHexColors.LIGHT_THEME_LAYER)),
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: HexColor(AppHexColors.PRIMARY_COLOR)),
    shadowColor: HexColor(AppHexColors.LIGHT_THEME_LABEL),
    appBarTheme: AppBarTheme(
      titleTextStyle: fontStyle.copyWith(
        color: HexColor(AppHexColors.LIGHT_THEME_TITLE_TEXT),
      ),
      iconTheme:
          IconThemeData(color: HexColor(AppHexColors.LIGHT_THEME_TITLE_TEXT)),
      actionsIconTheme:
          IconThemeData(color: HexColor(AppHexColors.LIGHT_THEME_TITLE_TEXT)),
      backgroundColor: HexColor(AppHexColors.LIGHT_THEME_LAYER),
      foregroundColor: HexColor(AppHexColors.LIGHT_THEME_TITLE_TEXT),
    ),
    primaryTextTheme: fontTheme.copyWith(
      headline6: fontStyle.copyWith(
        color: HexColor(AppHexColors.LIGHT_THEME_TITLE_TEXT),
      ),
    ),
    textTheme: fontTheme
        .copyWith(
          bodyText1: fontStyle.copyWith(
            color: HexColor(AppHexColors.LIGHT_THEME_BODY_TEXT),
          ),
          bodyText2: fontStyle.copyWith(
            color: HexColor(AppHexColors.LIGHT_THEME_BODY_TEXT),
          ),
          headline1: fontStyle.copyWith(
            color: HexColor(AppHexColors.LIGHT_THEME_TITLE_TEXT),
          ),
          headline2: fontStyle.copyWith(
            color: HexColor(AppHexColors.LIGHT_THEME_TITLE_TEXT),
          ),
          headline3: fontStyle.copyWith(
            color: HexColor(AppHexColors.LIGHT_THEME_TITLE_TEXT),
          ),
          headline4: fontStyle.copyWith(
            color: HexColor(AppHexColors.LIGHT_THEME_TITLE_TEXT),
            fontWeight: FontWeight.bold
          ),
          headline5: fontStyle.copyWith(
              color: HexColor(AppHexColors.LIGHT_THEME_TITLE_TEXT),
              fontWeight: FontWeight.bold),
          headline6: fontStyle.copyWith(
              color: HexColor(AppHexColors.LIGHT_THEME_TITLE_TEXT),
              fontWeight: FontWeight.bold),
        )
        .apply(bodyColor: HexColor(AppHexColors.LIGHT_THEME_TITLE_TEXT)),
    cardColor: HexColor(AppHexColors.LIGHT_THEME_LAYER),
    backgroundColor: HexColor(AppHexColors.LIGHT_THEME_BACKGROUND),
    dialogBackgroundColor: HexColor(AppHexColors.LIGHT_THEME_LAYER),
  );
}
