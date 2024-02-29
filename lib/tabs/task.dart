import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_project/my_theme.dart';
import 'package:to_do_project/providers/my_provider.dart';
import 'package:to_do_project/tabs/task_item.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Column(
      children: [
        DatePicker(
          DateTime.now(),
          initialSelectedDate: DateTime.now(),
          dateTextStyle: TextStyle(color:provider.myTheme==ThemeMode.dark? MyThemeData.whiteColor:MyThemeData.blackColor),
          dayTextStyle: TextStyle(color: provider.myTheme==ThemeMode.dark? MyThemeData.whiteColor:MyThemeData.blackColor),
          monthTextStyle:TextStyle(color: provider.myTheme==ThemeMode.dark? MyThemeData.whiteColor:MyThemeData.blackColor) ,
          selectionColor: MyThemeData.primaryColor,
          selectedTextColor: MyThemeData.whiteColor,
          locale: "en",
          height: 100,
        ),
        SizedBox(
          height: 8,
        ),
        Expanded(
          child: ListView.separated(
            itemBuilder:(context, index) {
              return TaskItem();
            },
            itemCount: 9,
            separatorBuilder: (BuildContext context, int index)=>
            SizedBox(height: 10,),
          ),
        )
      ],
    );
  }
}
