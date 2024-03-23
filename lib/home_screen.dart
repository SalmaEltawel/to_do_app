import 'package:flutter/material.dart';
import 'package:to_do_project/tabs/setting.dart';
import 'package:to_do_project/tabs/task.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'add_task_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
static const String routeName="homeScreen";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.appName,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        child: BottomNavigationBar(
            iconSize: 30,
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.list), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context, builder: (context) {
            return Container(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTaskBottomSheet());
          },);
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: tabs[index],

    );
  }

  List<Widget> tabs = [
    TasksScreen(),
    SettingScreen(),
  ];
}
