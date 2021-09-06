import 'package:flutter/material.dart';
import 'package:road_side/injection.dart';
import 'package:injectable/injectable.dart';
import 'package:road_side/presentation/main_screen/main_screen.dart';
import 'package:road_side/presentation/register/register_page.dart';
import 'package:road_side/presentation/setting/setting_screen.dart';
import 'package:road_side/presentation/sign_in/sign_in_page.dart';
import 'package:road_side/presentation/profile/profile_screen.dart';

Future<void> main() async {
  configureInjection(Environment.prod);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Road Side',
      //home: MainScreen(),
      home: RegisterPage(),
    ),
  );
}
