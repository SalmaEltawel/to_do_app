import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_project/my_theme.dart';
import 'package:to_do_project/providers/my_provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeLanguage("en");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.english,
                    style: GoogleFonts.poppins(
                        color: provider.languageCode == "en"
                            ? MyThemeData.primaryColor
                            : MyThemeData.blackColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w400)),
                provider.languageCode == "en"
                    ? Icon(
                        Icons.done,
                        color: Colors.blue,
                        size: 30,
                      )
                    : SizedBox(),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage("ar");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.arabic,
                    style: GoogleFonts.poppins(
                        color: provider.languageCode == "en"
                            ? MyThemeData.blackColor
                            : MyThemeData.primaryColor,
                       // provider.myTheme==MyThemeData.lightTheme?
                        fontSize: 25,
                        fontWeight: FontWeight.w400)),
                provider.languageCode == "en"
                    ? SizedBox()
                    : Icon(
                        Icons.done,
                        color: Colors.blue,
                        size: 30,
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
