// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furama/constants.dart';
import 'home.dart';

void main() {
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.landscapeLeft,
  // ]);
  runApp(const MyApp());

  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.landscapeLeft]).then(
  //   (_) => runApp(const MyApp()),
  // );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'EncodeSansSemiCondensed-Regular',
        primaryColor: mainColor,
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
