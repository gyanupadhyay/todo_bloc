import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/tasks_bloc/tasks_bloc.dart';
import 'package:todo_bloc/models/task_model.dart';
import 'package:uuid/uuid.dart';

class AddTaskScreen extends StatelessWidget {
   const AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
     var uuid = const Uuid();

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
                var task = Task(
                  description: descriptionController.text,
                  title: titleController.text,
                  id: uuid.v4(),
                  date: DateTime.now().toString(),
                );
                context.read<TasksBloc>().add(AddTask(task: task));
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        ),
        
      ]),
    );
  }
}
