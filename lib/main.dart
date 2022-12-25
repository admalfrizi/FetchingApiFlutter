import 'package:fetch_data_api_json_array/Screen/Home.dart';
import 'package:fetch_data_api_json_array/services/api.dart';
import 'package:fetch_data_api_json_array/services/connectService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => APIService()
          ),
          RepositoryProvider(
            create: (context) => ConnectivityService()
          ),
        ],
        child: Home(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}