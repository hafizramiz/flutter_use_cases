import 'package:flutter/material.dart';
import 'package:flutter_use_case/use_cases/builder_example/builder_example.dart';
import 'package:flutter_use_case/use_cases/cancel_token/cancel_token.dart';
import 'package:flutter_use_case/use_cases/inherited_example/inherited_example.dart';
import 'package:flutter_use_case/use_cases/widget-tree-render-tree-element-tree/example.dart';
import 'package:flutter_use_case/use_cases/widget_life_cycle/didchangedep.dart';
import 'package:flutter_use_case/use_cases/widget_life_cycle/initstateexample.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: DidChangeDepExample(),
    );
  }
}
