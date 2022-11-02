import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/tasks_bloc/tasks_bloc.dart';
import 'package:todo_bloc/models/task_model.dart';

class EditTasksScreen extends StatelessWidget {

  final Task oldTask;
   const EditTasksScreen({
    Key? key,
    required this.oldTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final TextEditingController titleController = TextEditingController(text: oldTask.title);
    final TextEditingController descriptionController = TextEditingController(text: oldTask.description);

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        const Text(
          'Add Task',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          autofocus: true,
          controller: titleController,
          decoration: const InputDecoration(
            label: Text('Title'),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(
          height: 10,
        ),

        
        TextField(
          autofocus: true,
          controller: descriptionController,
          minLines: 3,
          maxLines: 5,
          decoration: const InputDecoration(
            label: Text('description'),
            border: OutlineInputBorder(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                var editedTask = Task(
                  title: titleController.text,
                  description: descriptionController.text,
                  id: oldTask.id,
                  isDone: oldTask.isDone,
                  isFavorite: oldTask.isFavorite,
                  date: DateTime.now().toString(),
                );
                context.read<TasksBloc>().add(EditTask(
                  oldTask: oldTask,
                  newTask: editedTask,
                  ));
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
        
      ]),
    );
  }
}