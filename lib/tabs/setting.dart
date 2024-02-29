import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do_project/my_theme.dart';
import 'package:to_do_project/providers/my_provider.dart';
import 'package:to_do_project/tabs/settings_sheets/language_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'settings_sheets/mode_bottom_sheet.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.language,
              style: GoogleFonts.poppins(
                  color: provider.myTheme == ThemeMode.light
                      ? MyThemeData.blackColor
                      : MyThemeData.whiteColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700)),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  isDismissible: true,
                  builder: (context) {
                    return Container(
                      color: provider.myTheme == ThemeMode.dark
                          ? MyThemeData.secondaryColor
                          : MyThemeData.backGround,
                      height: MediaQuery.of(context).size.height * .6,
                      child: LanguageBottomSheet(),
                    );
                  });
            },
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: MyThemeData.whiteColor,
                ),
                child: Text(AppLocalizations.of(context)!.english,
                    style: GoogleFonts.poppins(
                        color: MyThemeData.primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w400))),
          ),
          SizedBox(
            height: 40,
          ),
          Text(AppLocalizations.of(context)!.mode,
              style: GoogleFonts.poppins(
                  color: provider.myTheme == ThemeMode.light
                      ? MyThemeData.blackColor
                      : MyThemeData.whiteColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700)),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  isDismissible: true,
                  builder: (context) {
                    return Container(
                      color: provider.myTheme == ThemeMode.dark
                          ? MyThemeData.secondaryColor
                          : MyThemeData.backGround,
                      height: MediaQuery.of(context).size.height * .6,
                      child: ModeBottomSheet(),
                    );
                  });
            },
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: MyThemeData.whiteColor,
                ),
                child: Text(AppLocalizations.of(context)!.light,
                    style: GoogleFonts.poppins(
                        color: MyThemeData.primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w400))),
          ),
        ],
      ),
    );
  }
}
