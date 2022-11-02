import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/blocs/tasks_bloc/tasks_bloc.dart';
import '../widget/tasks_list.dart';

class CompletedTasksScreen extends StatelessWidget {
  const CompletedTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Chip(
              label: Text(
                '${state.completedTasks.length} Tasks',
              ),
            ),
          ),
          TasksList(tasksList: state.completedTasks),
        ],
      );
    });
  }
}