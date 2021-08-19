import 'package:flutter/material.dart';
import 'package:road_side/presentation/core/main_screen.dart';
import 'package:road_side/injection.dart';
import 'package:injectable/injectable.dart';

void main() {
  configureInjection(Environment.prod);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Road Side',
    home: MainScreen(),
  ));
}
