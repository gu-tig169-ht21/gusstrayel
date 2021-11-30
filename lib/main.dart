// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore, must_be_immutable

// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import './SecondView.dart';
import './model.dart';
import 'package:provider/provider.dart';

void main() async {
  var state = MyState();
  await state.getList();
  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SecondView(),
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Raleway',
      ),
    );
  }
}
