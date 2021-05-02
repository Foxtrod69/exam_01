import 'package:flutter/material.dart';
import 'package:midterm_01/screens/add_new_clothes_screen.dart';
import 'package:midterm_01/screens/clothes_details_screen.dart';
import 'package:midterm_01/screens/clothes_edit_screen.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothes App',
      theme: ThemeData(
        accentColor: Colors.blueAccent,
      ),
      home: HomeScreen(),
      routes: {
        ClothesDetailsScreen.routeName: (ctx) => ClothesDetailsScreen(),
        AddNewClothes.routeName: (ctx) => AddNewClothes(),
        EditMovieScreen.routeName: (ctx) => EditMovieScreen(),
      },
    );
  }
}
