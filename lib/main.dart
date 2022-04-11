import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/task_data.dart';
import 'tasksScreen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) {
      return TaskData();
    },
    child: const MaterialApp(
      home: TasksScreen(),
    ),
  ));
}
