import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_restapi/model/todo.dart';
import 'package:todoapp_restapi/pages/home_page.dart';
import 'package:todoapp_restapi/pages/intro_page.dart';
import 'package:todoapp_restapi/pages/todo_page.dart';
import 'package:todoapp_restapi/provider/todo_provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => TodoProvider(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const IntroPage(),
            routes: {
              '/intropage': (context) => const IntroPage(),
              '/homepage': (context) => const HomePage(),
              '/todopage': (context) => const TodoPage(),
            }),
      );
}
