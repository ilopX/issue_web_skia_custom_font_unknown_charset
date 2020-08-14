import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Center(
          child: Container(
            height: 70,
            color: Colors.grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.blue,
                  child: Text(
                    '01: Default font [ end: Alignment(-1, -1) ]',
                  ),
                ),
                Container(
                  color: Colors.amber,
                  child: Text(
                    '02: Custom font [  end: Alignment(-1, -1) ]',
                    style: const TextStyle(fontFamily: 'Arial'),
                  ),
                ),
                Container(
                  color: Colors.green,
                  child: Text(
                    '03: Import asset custom font [ end: Alignment(-1, -1) ]',
                    style: const TextStyle(
                      fontFamily: 'Segoe',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
