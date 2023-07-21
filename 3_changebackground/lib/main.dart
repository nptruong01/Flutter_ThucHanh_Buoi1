import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
  Directionality(
    textDirection: TextDirection.ltr,
    child: MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'My Homework'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color color = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  void changecolor() {
    setState(() {
      color = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
              color: color,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: changecolor,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue, // Set the background color to red
                      ),
                      child: Text('Nhan vao day de doi mau'),
                    )
                  ],
                ),
              ),
            ),


      ),
    );
  }
}
