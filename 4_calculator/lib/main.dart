import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator', // used by the OS task switcher
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
  final TextEditingController bController = TextEditingController();

  String result = '';

  void tong() {
    double a = double.parse(aController.text);
    double b = double.parse(bController.text);

    setState(() {
      result = '${a + b}';
    });
  }

  void hieu() {
    double a = double.parse(aController.text);
    double b = double.parse(bController.text);

    setState(() {
      result = '${a - b}';
    });
  }

  void tich() {
    double a = double.parse(aController.text);
    double b = double.parse(bController.text);

    setState(() {
      result = '${a * b}';
    });
  }

  void thuong() {
    double a = double.parse(aController.text);
    double b = double.parse(bController.text);

    setState(() {
      result = '${b != 0 ? a / b : double.infinity}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Calculator',
          style: TextStyle(color: Colors.white),
        ),
      ),
      // home: Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'https://bigtop.vn/blog/wp-content/uploads/2022/02/caculator.jpg',
              width: 120,
            ),
            SizedBox(height: 90),
            Text(
              'Nhập giá trị của a:',
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                controller: aController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^\d+\.?\d*$'),
                  ),
                ],
              ),
            ),
            Text(
              'Nhập giá trị của b:',
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                controller: bController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^\d+\.?\d*$'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text('Kết quả ' + result),
            SizedBox(height: 30),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: tong,
                    style: ElevatedButton.styleFrom(
                      primary:
                          Colors.blueAccent, // Set the background color to red
                    ),
                    child: Text('+'),
                  ),
                  SizedBox(width: 25),
                  ElevatedButton(
                    onPressed: hieu,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // Set the background color to red
                    ),
                    child: Text('-'),
                  ),
                  SizedBox(width: 25),
                  ElevatedButton(
                    onPressed: tich,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // Set the background color to red
                    ),
                    child: Text('x'),
                  ),
                  SizedBox(width: 25),
                  ElevatedButton(
                    onPressed: thuong,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange, // Set the background color to red
                    ),
                    child: Text(':'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
