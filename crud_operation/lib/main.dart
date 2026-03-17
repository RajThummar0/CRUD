// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'home_page.dart';
//
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'CRUD OPERATIONS',
//       theme: ThemeData(
//         scaffoldBackgroundColor: Colors.deepPurple[100],
//         buttonTheme: ButtonThemeData(buttonColor: Colors.blueAccent[200],
//           focusColor: Colors.purple[100],
//         ),
//       ),
//       home:HomePage(),
//     );
//   }
// }
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'firebase_options.dart'; // ADD THIS

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // FIX
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CRUD OPERATIONS',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.deepPurple,
      ),
      home: const HomePage(),
    );
  }
}