// ignore_for_file: prefer_const_constructors

import 'package:credbevy/home_page.dart';
import 'package:credbevy/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<MyProviders>(
          create: (context) => MyProviders(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Credbevy',
      home: HomePage(),
    );
  }
}
