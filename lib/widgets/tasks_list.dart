import 'package:flutter/material.dart';
import 'package:to_do/models/task.dart';
import 'package:to_do/widgets/tasks_tile.dart';

class TaskList extends StatefulWidget {
  final List<Task> tasks;
  const TaskList(this.tasks, {super.key});
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            isChecked: widget.tasks[index].isDone,
            taskTitle: widget.tasks[index].name,
            checkboxCallback: (checkboxState) {
              setState(() {
                widget.tasks[index].toggleDone();
              });
            });
      },
      itemCount: widget.tasks.length,
    );
  }
}
