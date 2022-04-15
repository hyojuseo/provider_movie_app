import 'package:flutter/material.dart';
import 'package:provider_simple_movie/home.dart';
import 'package:provider/provider.dart';
import 'package:provider_simple_movie/provider/bottom_navigation_provider.dart';
import 'package:provider_simple_movie/provider/movie_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black),
        ),
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (BuildContext context) => BottomnavigationProvider()),
          ChangeNotifierProvider(
              create: (BuildContext context) => MovieProvider()),
        ],
        child: Home(),
      ),
    );
  }
}
