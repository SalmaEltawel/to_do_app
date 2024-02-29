import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData{
  static Color primaryColor=Color(0xff5D9CEC);
  static Color secondaryColor=Color(0xff060E1E);

  static Color whiteColor=Color(0xffFFFFFF);
  static Color blackColor=Color(0xff141922);
  static Color backGround=Color(0xffDFECDB);


  static ThemeData lightTheme=ThemeData(
    scaffoldBackgroundColor: backGround,
    iconTheme: IconThemeData(color: whiteColor,size: 30),

    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      titleTextStyle: GoogleFonts.poppins(
          fontSize: 22, fontWeight: FontWeight.w700, color: whiteColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Color(0xffC8C9CB),
      selectedItemColor: primaryColor,
      backgroundColor: Colors.transparent,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      elevation: 0,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      height: 65,
      shape: CircularNotchedRectangle(),
      padding: EdgeInsets.zero,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      iconSize: 30,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: whiteColor, width: 3),
          borderRadius: BorderRadius.circular(30)),
    ),
  );
  static ThemeData DarkTheme=ThemeData(
    scaffoldBackgroundColor: secondaryColor,
    iconTheme: IconThemeData(color: whiteColor,size: 30),
    appBarTheme: AppBarTheme(
      backgroundColor: primaryColor,
      titleTextStyle: GoogleFonts.poppins(
          fontSize: 22, fontWeight: FontWeight.w700, color: blackColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Color(0xffC8C9CB),
      selectedItemColor: primaryColor,
      backgroundColor: Colors.transparent,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      elevation: 0,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      height: 65,
      shape: CircularNotchedRectangle(),
      padding: EdgeInsets.zero,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: whiteColor, width: 3),
          borderRadius: BorderRadius.circular(30)),
    ),
  );

}