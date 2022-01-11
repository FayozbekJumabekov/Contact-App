import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'contactBaza.dart';

class ListviewPage extends StatefulWidget {
  const ListviewPage({Key? key}) : super(key: key);

  static final String id = "listview_page";

  @override
  _ListviewPageState createState() => _ListviewPageState();
}

class _ListviewPageState extends State<ListviewPage> {
  List<Color> colorList = Colors.primaries;

  List<Contactt> contactList = AddContacts().getContact;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(
            height: 90,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: contactList.length,
                itemBuilder: (context, index) {
                  return contact_Item_horizontal(index);
                }),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: contactList.length,
            itemBuilder: (context, index) {
              return contact_Item_vertical(index);
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                height: 20,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget contact_Item_vertical(int index) {
    return Card(
        margin: EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
        elevation: 1,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: colorList[index % 16],
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

  Widget contact_Item_horizontal(int index) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 5, 10),
      width: 100,
      height: 60,
      decoration: BoxDecoration(
          color: colorList[index % 16],
          borderRadius: BorderRadius.circular(50)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.accents[index%16],
            radius: 25,
            child: Text(
              contactList[index].name[0],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

