import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class StatefulColorfulTile extends StatefulWidget {
  const StatefulColorfulTile({Key? key, this.myColor}) : super(key: key);
  
  final myColor;

  @override
  State<StatefulColorfulTile> createState() => _StatefulColorfulTileState();
}

class _StatefulColorfulTileState extends State<StatefulColorfulTile> {
  Color? myColor;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.myColor,
      child: const Padding(
        padding: EdgeInsets.all(70.0),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  Color? myColor;
  
  List<Widget> containers = [];

  @override
  void initState() {
    super.initState();
    myColor = Color(
      (math.Random().nextDouble() * 0xFFFFFF).toInt(),
    ).withOpacity(
      1.0,
    );
    containers.insert(0,  Padding(
      padding: EdgeInsets.all(10),
      child: StatefulColorfulTile(myColor: myColor),
    ));
    myColor = Color(
      (math.Random().nextDouble() * 0xFFFFFF).toInt(),
    ).withOpacity(
      1.0,
    );
    containers.insert(1,  Padding(
      padding: EdgeInsets.all(10),
      child: StatefulColorfulTile(myColor: myColor),
    ));
  }

  void swapColour() {
    setState(() {
      containers.insert(1, containers.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: containers,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => swapColour(),
        child: const Icon(Icons.change_circle_outlined),
      ),
    );
  }
}
