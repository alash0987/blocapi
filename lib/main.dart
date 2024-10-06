import 'package:blocapi/app_bloc_provider.dart';
import 'package:flutter/material.dart';
import 'home/screens/home_screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBlocProvider(
      child: MaterialApp(
        title: 'MultiBloc with Dio',
        home: HomePage(),
      ),
    );
  }
}
