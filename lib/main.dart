import 'package:flutter/material.dart';
import 'package:widget_catalog/pages/buttons_page.dart';
import 'package:widget_catalog/pages/contact_access_page.dart';
import 'package:widget_catalog/pages/dialog_and%20_drawer_page.dart';
import 'package:widget_catalog/pages/home_page.dart';
import 'package:widget_catalog/pages/listview_page.dart';
import 'package:widget_catalog/pages/pageview_page.dart';
import 'package:widget_catalog/pages/wifi_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        HomePage.id: (context) => HomePage(),
        DialogandDrawerPage.id: (context) => DialogandDrawerPage(),
        ButtonsPage.id: (context) => ButtonsPage(),
        ListviewPage.id: (context) => ListviewPage(),
        WiFiPage.id: (context) => WiFiPage(),
        PageViewPage.id: (context) => PageViewPage(),
        ContactAccessPage.id:(context)=>ContactAccessPage(),

      },
    );
  }
}
