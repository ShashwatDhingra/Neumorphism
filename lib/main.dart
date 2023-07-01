import 'dart:async';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double _size = 508;
  bool _isPressed = false;

  void pressIn() {
    setState(() {
      _isPressed = true;
      _size = 47;
    });
  }

  void  pressOut()
  {
    setState(() {
      _isPressed = false;
      _size = 50;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
          title: Center(child: Text("N E U M O R P H I S M    D E S I G N")),
          backgroundColor: Colors.grey[300]),
      body: Center(
        child: GestureDetector(
          onLongPressStart: (details) {
            pressIn();
          },
          onLongPressEnd: (details) {
            pressOut();
          },
          onTap: () {
            pressIn();
            Timer(Duration(milliseconds: 117), ()
            {
              pressOut();
            },);
          },
          child: Container(
            child: Center(
                child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Icon(
                      Icons.apple_outlined,
                      color: Colors.grey[400],
                      size: _size,
                    ))),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(23),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(4.0, 4.0),
                      blurRadius: 10,
                      inset: _isPressed),
                  BoxShadow(
                      color: Colors.white,
                      offset: Offset(-4.0, -4.0),
                      blurRadius: 10,
                      inset: _isPressed)
                ]),
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}
