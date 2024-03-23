import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_project/add_task_bottom_sheet.dart';
import 'package:to_do_project/firebase_functions.dart';
import 'package:to_do_project/my_theme.dart';
import 'package:to_do_project/providers/my_provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_project/tabs/edit_tab.dart';
import 'package:to_do_project/task_model.dart';

class TaskItem extends StatelessWidget {
  TaskItem({required this.model, super.key});

  TaskModel model;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        startActionPane:
            ActionPane(extentRatio: 0.7, motion: ScrollMotion(), children: [
          SlidableAction(
            onPressed: (context) {
              FirebaseFunctions.deleteTask(model.id);
            },
            label: "Delete",
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
          ),
          SlidableAction(
            onPressed: (context) {
              Navigator.pushNamed(context, EditTasks.routeName,
                  arguments: TaskModel(
                      title: model.title,
                      description: model.description,
                      date: model.date));
            },
            label: "Edit",
            icon: Icons.edit,
            backgroundColor: Colors.blue,
          ),
        ]),
        child: Container(
          height: 100,
          padding: const EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
              color: provider.myTheme == ThemeMode.light
                  ? MyThemeData.whiteColor
                  : MyThemeData.blackColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Row(children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: model.isDone ? Colors.blue : Colors.green),
              height: 80,
              width: 5,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  model.title,
                  style: GoogleFonts.poppins(
                      color: model.isDone
                          ? MyThemeData.primaryColor
                          : Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  model.description,
                  style: GoogleFonts.poppins(
                      color: model.isDone
                          ? MyThemeData.primaryColor
                          : Colors.green,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor:model.isDone? Colors.blue:Colors.green),
              onPressed: () {
                model.isDone = !(model.isDone);
                FirebaseFunctions.editTask(model.id, model);
              },
              child: model.isDone
                  ? Icon(
                      Icons.done,
                color: Colors.white,
                    )
                  : Text(
                      "Done !",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
            )
          ]),
        ),
      ),
    );
  }
}
