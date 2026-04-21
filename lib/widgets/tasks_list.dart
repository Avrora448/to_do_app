import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solo_tu/models/task_provider.dart';
import 'package:solo_tu/widgets/task_tile.dart';



class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskProvider.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                taskProvider.updateTask(task);
              },
              longPressCallback: () {
                taskProvider.deleteTask(task);
              },
            );
          },
          itemCount: taskProvider.taskCount,
        );
      },
    );
  }
}