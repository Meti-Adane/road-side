import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:road_side/infrastructure/api/api_auth_facade.dart';
import 'package:road_side/presentation/core/main_screen.dart';
import 'package:road_side/injection.dart';
import 'package:injectable/injectable.dart';
import 'package:road_side/presentation/sign_in/sign_in_page.dart';

Future<void> main() async {
  configureInjection(Environment.prod);
  WidgetsFlutterBinding.ensureInitialized();
  new ApiAuthFacade("api", http.Client());
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Road Side',
    home: SignInPage(),
  ));
}
