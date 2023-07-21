import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kiem tra so nguyen to',
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController aController = TextEditingController();
  String result = '';

  bool isPrime(int number) {
    if (number <= 1) return false;
    for (int i = 2; i * i <= number; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

  void checkPrime() {
    int number = int.tryParse(aController.text) ?? 0;
    bool isPrimeNumber = isPrime(number);
    setState(() {
      result = isPrimeNumber ? '$number là số nguyên tố' : '$number không là số nguyên tố';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Kiem tra so nguyen to',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 3), // Chỉnh độ rộng tối thiểu của TextField
                ),
                controller: aController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
            SizedBox(height: 150),
            Center(
              child: ElevatedButton(
                onPressed: checkPrime,
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                ),
                child: Text('Kiem Tra'),
              ),
            ),
            Text(result),
          ],
        ),
      ),
    );
  }
}
