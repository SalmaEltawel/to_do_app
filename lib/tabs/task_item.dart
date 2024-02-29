import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_project/my_theme.dart';
import 'package:to_do_project/providers/my_provider.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(horizontal: 28),
      decoration: BoxDecoration(
           color:provider.myTheme == ThemeMode.light? MyThemeData.whiteColor:MyThemeData.blackColor,
          borderRadius: BorderRadius.circular(20)),
      child: Row(children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.blue),
          height: 80,
          width: 5,
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.taskTitle,
              style: GoogleFonts.poppins(
                color:MyThemeData.primaryColor,
                  fontSize: 18, fontWeight: FontWeight.w700),
            ),
            Text(
              AppLocalizations.of(context)!.taskDescription,
              style: GoogleFonts.poppins(
                  color:MyThemeData.primaryColor,
                  fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Spacer(),
        Container(
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          width: 40,
          child: Icon(
            Icons.done,
          ),
        ),
      ]),
    );
  }
}
