import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Color a = Color(Random().nextInt(0xffffffff));
Color b = Color(Random().nextInt(0xffffffff));

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Container colour swapping"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            var temp = a;
            a = b;
            b = temp;
           
          });
        },
        child: Icon(Icons.swap_horiz,size: 28,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          children: [
            Container(height: 200, width: 200, color: b),
            Container(
              height: 200,
              width: 200,
              color: a,
            ),
          ],
        ),
      ),
    );
  }
}
