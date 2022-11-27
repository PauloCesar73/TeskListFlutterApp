import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sprinttwodesafio/src/controller/todo_controller.dart';
import 'package:sprinttwodesafio/src/view/home_page.dart';
import 'package:sprinttwodesafio/src/view/new_task_page_.dart';
import 'package:sprinttwodesafio/strings.dart';

void main() {
  final getIt = GetIt.instance;

  getIt.registerSingleton(TodoControllerList());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (_) => HomePage(),
        "/task":(_) => NewTask()
      },
    );
  }
}
