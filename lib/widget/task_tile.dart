import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_bloc/blocs/tasks_bloc/tasks_bloc.dart';
import 'package:todo_bloc/screens/edit_task_screen.dart';
import 'package:todo_bloc/widget/popup_menu.dart';
import '../models/task_model.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  void _removeOrDeleteTask(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TasksBloc>().add(DeleteTask(task: task))
        : context.read<TasksBloc>().add(RemoveTask(task: task));
  }


  void _editTask(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: EditTasksScreen(
                  oldTask: task,
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [ 
                task.isFavorite == false
                    ? const Icon(Icons.star_border_outlined)
                    : const Icon(Icons.star),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(
                    task.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                      decoration: task.isDone! ? TextDecoration.lineThrough : null,
                    ),
                            ),
                            Text( 
                            DateFormat()
                            .add_yMMMd()
                            .add_Hms()
                            .format(DateTime.parse(task.date)),
                            ),
                     ],
                    )
                  ),
                ],
              ),
            ),
          Row(
            children: [
              Checkbox(
            value: task.isDone,
            onChanged: task.isDeleted == false
                ? (value) {
                    context.read<TasksBloc>().add(UpdateTask(task: task));
                  }
                : null,
                  ),
                  PopupMenu(
                    task: task,
                    cancelOrDeleteCallback: () =>
                    _removeOrDeleteTask(context, task),
                    likeOrDislikeCallback: () =>
                      context.read<TasksBloc>().add(
                      MarkFavoriteOrUnFavoriteTask(task: task),
                      ),
                      editTaskCallback: () {
                        Navigator.of(context).pop();
                        _editTask(context);
                      },

                      restoreTaskCallback: () =>
                       context.read<TasksBloc>().add(RestoreTask(task: task)),
                  ),
        ],
        ),
      ],
      ),
    );
  }
}


