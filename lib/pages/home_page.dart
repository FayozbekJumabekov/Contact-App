import 'package:flutter/material.dart';
import 'package:widget_catalog/pages/buttons_page.dart';
import 'package:widget_catalog/pages/single_child_scroll.dart';

import 'dialog_and _drawer_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Dialog and Drawer page
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Colors.blueAccent,
                  minimumSize: Size(200, 50)),
              onPressed: () {
                Navigator.pushNamed(context, DialogandDrawerPage.id);
              },
              child: Text("Dialog and Drawer"),
            ),
            SizedBox(
              height: 20,
            ),

            // Buttons page
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Colors.blueAccent,
                  minimumSize: Size(200, 50)),
              onPressed: () {
                Navigator.pushNamed(context, ButtonsPage.id);
              },
              child: Text("Buttons"),
            ),
            SizedBox(
              height: 20,
            ),

            // SingleCHildScrollView
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Colors.blueAccent,
                  minimumSize: Size(200, 50)),
              onPressed: () {
                Navigator.pushNamed(context, SingleChildScroll.id);
              },
              child: Text("Single Child Scroll"),
            ),
          ],
        ),
      ),
    );
  }
}
