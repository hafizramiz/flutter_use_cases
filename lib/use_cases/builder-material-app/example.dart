

/// Burdaki Materail app'de builder metotu var orda ilave config ayarlari yapilabilir
/// Ornegin text scale factor, text direction vs gibi


// void main() {
//   runApp(DevicePreview(
//     enabled: true,
//     builder: (context) =>  const MyApp(), // Wrap your app
//   ));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       themeMode: ThemeMode.dark,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: SplashScreen(),

//        initialRoute: "/splash",
//       routes: {
//         "/splash": (context) => SplashScreen(),
//         "/login": (context) =>ChangeNotifierProvider(
//     create: (BuildContext context) => LoginViewModel(),
//     child: LoginScreen(),
//     ),
//         "/home": (context) => HomeScreen(),
//       },
//     );
//   }
// }
