import 'dart:async';

import 'package:clock_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clock App Xiaomi',
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.subject_rounded,
            size: 18,
          ),
        ),
        title: const Text(
          'Pomodoro timer',
        ),
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add, size: 18)),
        ],
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider<TimerProvider>(create: (_) => TimerProvider()),
        ],
        child: TimerPage(),
      ),
    );
  }
}
