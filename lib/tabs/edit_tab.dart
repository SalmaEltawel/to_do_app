import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do_project/firebase_functions.dart';
import 'package:to_do_project/home_screen.dart';
import 'package:to_do_project/tabs/task_item.dart';
import 'package:to_do_project/task_model.dart';

class EditTasks extends StatefulWidget {
  static const String routeName = "editTask";

  EditTasks({
    super.key,
  });

  @override
  State<EditTasks> createState() => _EditTasksState();
}

class _EditTasksState extends State<EditTasks> {
  var selectedDate = DateTime.now();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  bool edit = true;

  @override
  Widget build(BuildContext context) {
    var taskModel = ModalRoute
        .of(context)!
        .settings
        .arguments as TaskModel;
    if (edit) {
      titleController.text = taskModel.title;
      descriptionController.text = taskModel.description;
    }
    edit = false;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          AppLocalizations.of(context)!.appName,
        ),
      ),
      body: Card(
        elevation: 2,
        margin: EdgeInsets.all(30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: 500,
          child: Column(
            children: [
              Text(
                "Edit Task",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: "title",
                  hintStyle: TextStyle(fontSize: 20),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: descriptionController,

                decoration: InputDecoration(
                  hintText: "description",
                  hintStyle: TextStyle(fontSize: 20),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  child: const Text("Select time",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w400))),
              InkWell(
                onTap: () {
                  selectDate();
                },
                child: Text("${selectedDate.toString().substring(0, 10)}",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600)),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      TaskModel editTask = TaskModel(
                          title: titleController.text,
                          description: descriptionController.text,
                          date: selectedDate.millisecondsSinceEpoch,id:taskModel.id,isDone: taskModel.isDone );

                      FirebaseFunctions.editTask(
                          taskModel.id,
                          editTask
                      );
                      Navigator.pushNamed(context,HomeScreen.routeName);

                    },
                    child: Text(
                      "Save Changes",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  selectDate() async {
    DateTime? chosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }
}
