import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_use_case/use_cases/bloc/ui/home_screen.dart';
import 'package:flutter_use_case/use_cases/bloc/ui/login_screen.dart';
import 'package:flutter_use_case/use_cases/bloc/ui/splash_screen.dart';
import 'package:flutter_use_case/use_cases/bloc/view_model/LoginViewModel.dart';
import 'package:flutter_use_case/use_cases/builder_example/builder_example.dart';
import 'package:flutter_use_case/use_cases/cancel_token/cancel_token.dart';
import 'package:flutter_use_case/use_cases/inherited_example/inherited_example.dart';
import 'package:flutter_use_case/use_cases/widget-tree-render-tree-element-tree/example.dart';
import 'package:flutter_use_case/use_cases/widget_life_cycle/didchangedep.dart';
import 'package:flutter_use_case/use_cases/widget_life_cycle/initstateexample.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (context) =>  const MyApp(), // Wrap your app
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashScreen(),

       initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashScreen(),
        "/login": (context) =>ChangeNotifierProvider(
    create: (BuildContext context) => LoginViewModel(),
    child: LoginScreen(),
    ),
        "/home": (context) => HomeScreen(),
      },
    );
  }
}
