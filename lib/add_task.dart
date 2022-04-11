import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_data.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  late String newtasktitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF757575),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Add Task',
              style: TextStyle(fontSize: 20, color: Colors.lightBlueAccent),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              cursorColor: Colors.lightBlueAccent,
              cursorHeight: 25,
              decoration: const InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.lightBlueAccent, width: 1.5),
                ),
              ),
              onChanged: (value) {
                newtasktitle = value;
              },
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              child: Container(
                child: const Center(
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                color: Colors.lightBlueAccent,
                height: 50,
                width: double.infinity,
              ),
              onTap: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newtasktitle);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
