import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_project/firebase_functions.dart';
import 'package:to_do_project/my_theme.dart';
import 'package:to_do_project/providers/my_provider.dart';
import 'package:to_do_project/tabs/task_item.dart';
import 'package:to_do_project/task_model.dart';

class TasksScreen extends StatefulWidget {
    TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  var selectedDate=DateTime.now();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Column(
      children: [
        DatePicker(
          DateTime.now(),
          initialSelectedDate: selectedDate,
          onDateChange: (date){
            selectedDate=date;
            setState(() {

            });
          },
          dateTextStyle: TextStyle(
              color: provider.myTheme == ThemeMode.dark
                  ? MyThemeData.whiteColor
                  : MyThemeData.blackColor),
          dayTextStyle: TextStyle(
              color: provider.myTheme == ThemeMode.dark
                  ? MyThemeData.whiteColor
                  : MyThemeData.blackColor),
          monthTextStyle: TextStyle(
              color: provider.myTheme == ThemeMode.dark
                  ? MyThemeData.whiteColor
                  : MyThemeData.blackColor),
          selectionColor: MyThemeData.primaryColor,
          selectedTextColor: MyThemeData.whiteColor,
          locale: "en",
          height: 100,
        ),
        SizedBox(
          height: 8,
        ),
        Expanded(
            child: StreamBuilder(
                stream: FirebaseFunctions.getTasks(selectedDate),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Column(
                      children: [
                        Text("SomeThing Went Wrong"),
                        ElevatedButton(
                            onPressed: () {}, child: Text("Try Again "))
                      ],
                    );
                  }
                  List<TaskModel> tasksList =
                      snapshot.data?.docs.map((doc) =>
                          doc.data()).toList() ?? [];
                  if(tasksList.isEmpty){
                    return Center(child: Text("No Tasks"));
                  }
                  return ListView.separated(itemBuilder: (context, index) {
                    return TaskItem(model: tasksList[index],);

                  },
                      separatorBuilder:
                          (context, index) => SizedBox(height: 18,),
                      itemCount: tasksList.length);
                })),
      ],
    );
  }
}
