import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final colors = [Colors.purple, Colors.green, Colors.pink];
  Color? indicatorColor;
  TabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this)
      ..addListener(() {
        setState(() {
          indicatorColor = colors[_controller?.index ?? 0];
        });
      });
    indicatorColor = colors[0];
  }

  Widget _buildScreen() {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Container(
        color: Colors.blue,
        child: TabBar(
          indicator: BoxDecoration(
            color: indicatorColor
          ),
            labelColor: Colors.black,
            controller: _controller,
            indicatorWeight: 4,
            // indicatorColor: indicatorColor,
            tabs: [
              Tab(
                child: Container(
                  child: Text('A'),
                ),
              ),
              Tab(
                child: Text('B'),
              ),
              Tab(
                child: Text('C'),
              ),
            ]),
      ),
      body: Container(
        child: TabBarView(
          controller: _controller,
          children: [
            Center(
              child: Text('aa'),
            ),
            Center(
              child: Text('bb'),
            ),
            Center(
              child: Text('cc'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: _buildScreen(),
    );
  }
}
