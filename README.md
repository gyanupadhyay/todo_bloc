# Flutter Tasks App

A Flutter task-management project exploring **Bloc state management** and
**local state persistence with HydratedBloc**.

## What's in the project

- Screens for pending, completed, and favorite tasks.
- Task creation and editing, with a recycle bin for removed tasks.
- Restore, permanent-delete, and clear-recycle-bin event handlers.
- Light and dark themes, managed by a separate persisted Bloc.
- JSON serialization for task and theme state.

## How it's organized

| Location | Responsibility |
| --- | --- |
| [`lib/blocs/tasks_bloc/`](lib/blocs/tasks_bloc/) | Task events, state transitions, and persistence serialization. |
| [`lib/blocs/switch_bloc/`](lib/blocs/switch_bloc/) | Theme selection and persistence. |
| [`lib/models/task_model.dart`](lib/models/task_model.dart) | Task model. |
| [`lib/screens/`](lib/screens/) | Task lists, add/edit forms, navigation, and recycle bin. |
| [`lib/main.dart`](lib/main.dart) | Hydrated storage initialization and Bloc providers. |

## Running locally

This is an older project. Its declared Dart SDK constraint is
`>=2.18.2 <3.0.0`, and its code uses the Bloc/HydratedBloc 8 APIs. Use a Flutter
SDK whose bundled Dart version satisfies that range; the current source needs
migration before use with Dart 3.

```sh
git clone https://github.com/gyanupadhyay/todo_bloc.git
cd todo_bloc
flutter pub get
flutter run
```

Hydrated storage is initialized using the application documents directory.
The project does not include a backend or cross-device synchronization.

## Project status

This repository documents an earlier Flutter implementation. The documentation
refresh did not include a new build or device test, so it does not establish
current toolchain compatibility or verify every task flow. The implementation
and dependency constraints are the reference for further maintenance.
