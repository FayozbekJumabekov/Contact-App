import 'package:flutter/material.dart';
import 'package:widget_catalog/pages/contacts_page.dart';

import 'package:widget_catalog/pages/phone_page.dart';
import 'package:widget_catalog/pages/pageview_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PageViewPage(),
      routes: {

        PhonePage.id: (context) => PhonePage(),
        PageViewPage.id: (context) => PageViewPage(),
        ContactPage.id:(context)=>ContactPage(),

      },
    );
  }
}
