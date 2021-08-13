import 'package:flutter/material.dart';
import 'package:inventry/HomePage.dart';
import 'package:inventry/arun.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.brown),
      home: BillDetails(),
    );
  }
}
