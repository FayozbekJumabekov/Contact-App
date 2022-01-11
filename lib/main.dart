import 'package:flutter/material.dart';
import 'package:widget_catalog/pages/contact_access_page.dart';

import 'package:widget_catalog/pages/listview_page.dart';
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

        ListviewPage.id: (context) => ListviewPage(),
        PageViewPage.id: (context) => PageViewPage(),
        ContactAccessPage.id:(context)=>ContactAccessPage(),

      },
    );
  }
}
