import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task_data.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: ((context, index) {
            final task = taskData.tasks[index];
            return TaskTile(task.isdone, task.name, (value) {
              taskData.updatetask(task);
            }, () {
              taskData.deletetask(task);
            });
          }),
          itemCount: Provider.of<TaskData>(context).taskcount,
        );
      },
    );
  }
}

class TaskTile extends StatelessWidget {
  const TaskTile(
      this.ischecked, this.tasktitle, this.callback, this.longcallback,
      {Key? key})
      : super(key: key);

  final bool ischecked;
  final String tasktitle;
  final Function(bool?) callback;
  final Function() longcallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        tasktitle,
        style: TextStyle(
            decoration: ischecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: ischecked,
          onChanged: callback),
      onLongPress: longcallback,
    );
  }
}
