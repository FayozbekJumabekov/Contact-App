import 'package:flutter/material.dart';

class SingleChildScroll extends StatefulWidget {
  const SingleChildScroll({Key? key}) : super(key: key);
  static final String id = "single_child_scroll";

  @override
  _SingleChildScrollState createState() => _SingleChildScrollState();
}

class _SingleChildScrollState extends State<SingleChildScroll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SingleChildScroll Page"),
      ),
    );
  }
}
