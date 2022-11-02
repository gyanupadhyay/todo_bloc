import 'package:flutter/material.dart';
import 'package:todo_bloc/screens/add_task_screen.dart';
import 'package:todo_bloc/screens/my_drawer.dart';
import 'package:todo_bloc/screens/pending_tasks_screen.dart';

import 'Favorite_tasks_screen.dart';
import 'completed_tasks_screen.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({
    Key? key,
  }) : super(key: key);

  static const id = 'tabs_screen';

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  final List _pageDetails = [
    const PendingTasksScreen(),
    const CompletedTasksScreen(),
     const FavoriteTasksScreen(), 
  ];

  final List<String> title = [ 'PendingTasks', 'CompletedTasks', 'FavoriteTasks '];

  var _selectedPageIndex = 0;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const AddTaskScreen(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title[_selectedPageIndex]),
        actions: [
          IconButton(
            onPressed: () => _addTask(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: const MyDrawer(),
      body: _pageDetails[_selectedPageIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTask(context),
        tooltip: ' Add Task',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.list), label: 'Pending Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.list), label: 'Completed Tasks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.list), label: 'favourite Tasks'),
        ],
      ),
    );
  }
}
