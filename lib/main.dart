import 'package:flutter/material.dart';
import 'package:road_side/presentation/core/main_screen.dart';
import 'package:road_side/presentation/home/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Road Side',
    home: MainScreen(),
  ));
}
