import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pepetes/pages/home_page.dart';
import 'package:pepetes/services/backend-service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String BACKEND_LOCATION = 'api-pepetes.razafini.com';///String.fromEnvironment('BACKEND_LOCATION', defaultValue: 'localhost:8080');
  GetIt.instance.registerSingleton(BackendService(BACKEND_LOCATION));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}