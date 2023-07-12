import 'package:flutter/material.dart';

import 'package:chat_app/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'chat',
      routes: appRoutes,
    );
  }
}