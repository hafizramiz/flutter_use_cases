import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_use_case/use_cases/inherited_example/app_theme/app-colors.dart';
import 'package:provider/provider.dart';

import '../../bloc/ui/home_screen.dart';
import '../../bloc/ui/login_screen.dart';
import '../../bloc/ui/splash_screen.dart';
import '../../bloc/view_model/LoginViewModel.dart';
import 'app-theme.dart';
import 'app-typograpy.dart';

class AppThemeScope extends InheritedWidget {
  const AppThemeScope({super.key, required super.child, required this.theme});

  final AppTheme theme;

  static AppThemeScope of(BuildContext context) {
    final AppThemeScope? result = context
        .dependOnInheritedWidgetOfExactType<AppThemeScope>();
    assert(result != null, 'No AppThemeScope found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(AppThemeScope oldWidget) => true;
}

/// How to use?

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /// Burda home vermezsem hata vermiyor.
    return AppThemeScope(
      theme: AppTheme(
        colors: AppColors.dark(),
        typography: AppTypography.regular(),
      ),
      child: MaterialApp(
        themeMode: ThemeMode.dark,
        title: 'Flutter Use Cases',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),

        // home: SplashScreen(),
        initialRoute: "/splash",
        routes: {
          "/splash": (context) => SplashScreen(),
          "/login_request_model": (context) => ChangeNotifierProvider(
            create: (BuildContext context) => LoginViewModel(),
            child: LoginScreen(),
          ),
          "/home": (context) => HomeScreen(),
        },
      ),
    );
  }
}
