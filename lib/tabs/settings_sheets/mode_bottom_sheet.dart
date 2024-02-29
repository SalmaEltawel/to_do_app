import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_project/my_theme.dart';
import 'package:to_do_project/providers/my_provider.dart';

class ModeBottomSheet extends StatelessWidget {
  ModeBottomSheet({super.key});

  bool isLight = true;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.changeThemeMode(ThemeMode.light);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.light,
                    style: GoogleFonts.poppins(
                        color: provider.myTheme == ThemeMode.light
                            ? MyThemeData.primaryColor
                            : MyThemeData.whiteColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w400)),
                provider.myTheme == ThemeMode.light
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
              provider.changeThemeMode(ThemeMode.dark);

            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppLocalizations.of(context)!.dark,
                    style: GoogleFonts.poppins(
                        color: provider.myTheme == ThemeMode.light
                            ? MyThemeData.whiteColor
                            : MyThemeData.primaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w400)),
                provider.myTheme == ThemeMode.light
                    ? SizedBox()
                    : Icon(
                        Icons.done,
                        color:MyThemeData.primaryColor,
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
