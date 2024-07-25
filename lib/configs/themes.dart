import 'package:flutter/material.dart';
import 'package:flutter_flashcards/configs/constants.dart';
import 'package:flutter_flashcards/configs/palette.dart';
import 'package:google_fonts/google_fonts.dart';

final appTheme = ThemeData(
    primaryColor: Palette().green,
    textTheme: TextTheme(
      bodyMedium: TextStyle(
          color:Palette().trueWhite,
          fontSize: 15,
          fontFamily: GoogleFonts.notoSans().fontFamily),
      displayLarge: TextStyle(
        color:Palette().trueWhite,
        fontSize: 58,
        fontFamily: GoogleFonts.notoSans().fontFamily,
        fontWeight: FontWeight.bold,
      ),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: GoogleFonts.notoSans().fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      color: Palette().green,
    ),
    scaffoldBackgroundColor: Palette().trueWhite,
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kCircularBorderRadius),
      ),
      backgroundColor: Palette().green,
      contentTextStyle: TextStyle(
          fontFamily: GoogleFonts.notoSans().fontFamily,
          fontSize: 20,
          color:Palette().trueWhite),
      titleTextStyle: TextStyle(
          fontFamily: GoogleFonts.notoSans().fontFamily,
          fontSize: 20,
          color:Palette().trueWhite),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kCircularBorderRadius),
              side:  BorderSide(
                color:Palette().black,
              ),
            ),
            backgroundColor: Palette().trueWhite,
            textStyle: TextStyle(
              fontFamily: GoogleFonts.notoSans().fontFamily,
              color:Palette().black,
              fontSize: 12,
            ))),
    progressIndicatorTheme:  ProgressIndicatorThemeData(
      color: Palette().green,
      linearTrackColor: Colors.grey,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all<Color>(Palette().green),
    ),
    listTileTheme:  ListTileThemeData(
      textColor:Palette().trueWhite,
      iconColor:Palette().trueWhite,
    ));
