import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/screens/recycle_bin.dart';
import 'package:todo_bloc/screens/tabs_screen.dart';
import '../blocs/switch_bloc/switch_bloc.dart';
import '../blocs/tasks_bloc/tasks_bloc.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
            color: Colors.grey,
            child: Text(
              'Task Drawer',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () => Navigator.of(context).pushReplacementNamed(
                  TabsScreen.id,
                ),
                child: ListTile(
                  leading: const Icon(Icons.folder_special),
                  title: const Text('My Tasks'),
                  trailing: Text('${state.pendingTasks.length}'),
                ),
              );
            },
          ),
          const Divider(),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () => Navigator.of(context).pushReplacementNamed(
                  RecycleBin.id,
                ),
                child: ListTile(
                  leading: const Icon(Icons.delete),
                  title: const Text('Bin'),
                  trailing: Text('${state.removedTasks.length}'),
                ),
              );
            },
          ),
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              return Switch(
                value: state.switchValue,
                onChanged: (newValue) {
                  newValue
                      ? context.read<SwitchBloc>().add(SwitchOnEvent())
                      : context.read<SwitchBloc>().add(SwitchOffEvent());
                },
              );
            },
          ),
        ],
      ),
    ));
  }
}
