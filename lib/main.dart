import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_using_provider/controller/controller.dart';
import 'package:todo_app_using_provider/view/view.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => Controller(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Viewpage());
  }
}
