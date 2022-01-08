import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ContactAccessPage extends StatefulWidget {
  static const String id = "contact_access_page";

  const ContactAccessPage({Key? key}) : super(key: key);

  @override
  _ContactAccessPageState createState() => _ContactAccessPageState();
}

class _ContactAccessPageState extends State<ContactAccessPage> {
  Iterable<Contact> _contacts = [];
  List<Color> colorList = Colors.accents;

  bool indicator = true;

  Future<void> changeIndicator() async {
    await Future.delayed(Duration(milliseconds: 1400));

    setState(() {
      indicator = false;
    });
  }

  @override
  void initState() {
    getContacts();
    super.initState();
    changeIndicator();
  }

  Future<void> getContacts() async {
    //Make sure we already have permissions for contacts when we get to this
    //page, so we can just retrieve it
    final Iterable<Contact> contacts = await ContactsService.getContacts();
    setState(() {
      _contacts = contacts.where((element) => element.phones!.isNotEmpty);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          actions: [
            SizedBox(
              width: 50,
            ),
            Expanded(
                child: Container(
              child: TextFormField(

                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10, top: 10),
                  hintText: "Search contacts :",
                ),
              ),
            ))
          ],
        ),
        body: (indicator)
            ? Center(
                child: SpinKitThreeBounce(
                  color: Colors.black,
                  size: 30,
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 5),
                itemCount: _contacts.length,
                itemBuilder: (BuildContext context, int index) {
                  return _itemContacts(index);
                },
              ));
  }

  Widget _itemContacts(int index) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: colorList[index % 16],
            radius: 25,
            child: Text(
              _contacts.elementAt(index).initials(),
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          title: Text(
            _contacts.elementAt(index).displayName ?? '',
          ),
          subtitle: Text(
            _contacts.elementAt(index).phones!.first.value.toString(),
            style: TextStyle(color: Colors.grey),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.phone,
              color: Colors.green,
              size: 30,
            ),
            onPressed: () {
              launch("tel://${_contacts.elementAt(index).phones!.first.value}");
            },
          ),
        ),
        Divider(),
      ],
    );
  }
}
