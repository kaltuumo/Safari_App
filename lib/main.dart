import 'package:flutter/material.dart';
import 'package:safari_app/src/features/auth/screens/getstart/get_start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      // 🔗 ROUTES
      initialRoute: '/',
      routes: {'/': (context) => const GetStartedPage()},
    );
  }
}
