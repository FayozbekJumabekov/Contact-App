import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ListviewPage extends StatefulWidget {
  const ListviewPage({Key? key}) : super(key: key);

  static final String id = "listview_page";

  @override
  _ListviewPageState createState() => _ListviewPageState();
}

class _ListviewPageState extends State<ListviewPage> {
  List<Color> colorList = [
    Colors.orangeAccent,
    Colors.purple,
    Colors.blueAccent,
    Colors.redAccent,
    Colors.blue,
    Colors.orangeAccent,
    Colors.purple,
    Colors.blueAccent,
    Colors.redAccent,
    Colors.blue
  ];

  List<Contact> contactList = [
    Contact("Ilhomjon", "+998945096336"),
    Contact("Javlon aka", "+998901234567"),
    Contact("Doniyor", "+9989300000000"),
    Contact("Mansurbek", "+998914747474"),
    Contact("Sanjar aka", "+9989341000140"),
    Contact("Sardorbek", "+99896547841"),
    Contact("Shaxriyor", "+998911122767"),
    Contact("Ucell Call Centre", "8123"),
    Contact("PDP Call Centre", "+998787774747"),
    Contact("My number", "+998930000342"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Contacts"),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: contactList.length,
              itemBuilder: (context, index) {
                return card(index);
              })),
    );
  }

  Widget card(int index) {
    return Card(
        margin: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
        elevation: 1,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: colorList[index],
            radius: 25,
            child: Text(
              contactList[index].name[0],
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          title: Text(contactList[index].name),
          subtitle: Text(
            "Mobile : ${contactList[index].phone}",
            style: TextStyle(color: Colors.grey),
          ),
          trailing: IconButton(
            onPressed: () {
              launch("tel:${contactList[index].phone}");
            },
            icon: Icon(
              Icons.phone,
              size: 30,
              color: Colors.green,
            ),
          ),
        ));
  }
}

class Contact {
  String name;
  String phone;

  Contact(this.name, this.phone);
}
