import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'contactBaza.dart';

class ContactAccessPage extends StatefulWidget {
  static const String id = "contact_access_page";

  AddContacts cont = AddContacts();

  ContactAccessPage({Key? key}) : super(key: key);

  @override
  _ContactAccessPageState createState() => _ContactAccessPageState();
}

class _ContactAccessPageState extends State<ContactAccessPage> {
  var _textEditingcontroller = TextEditingController();

  void clearText() {
    setState(() {
      _textEditingcontroller.clear();
    });
  }

  String text = "";

  Iterable<Contact> _contacts = [];
  List<Color> colorList = Colors.primaries;

  bool indicator = true;

  Future<void> changeWaitingAnimation() async {
    await Future.delayed(Duration(milliseconds: 1300));

    setState(() {
      indicator = false;
    });
  }

  @override
  void initState() {
    getContacts();
    super.initState();
    changeWaitingAnimation();
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
          elevation: 3,
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
              padding: EdgeInsets.only(top: 5),
              child: TextFormField(
                controller: _textEditingcontroller,
                onChanged: (text) {
                  setState(() {
                    this.text = text;
                  });
                },
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: "Search contacts :",
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: () {
                      text = "";
                      clearText();
                    },
                    icon: Icon(
                      Icons.clear,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            )),
          ],
        ),
        body: (indicator)
            ? SpinKitThreeBounce(
                color: Colors.black,
                size: 30,
              )
            : ListView.builder(
                padding: const EdgeInsets.only(top: 15, left: 10, right: 5),
                itemCount: _contacts.length,
                itemBuilder: (BuildContext context, int index) {
                  return _itemContacts(index, text);
                },
              ));
  }

  Widget _itemContacts(int index, String text) {
    return (_contacts
            .elementAt(index)
            .displayName!
            .toLowerCase()
            .contains(text))
        ? Column(
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
                    launch(
                        "tel://${_contacts.elementAt(index).phones!.first.value}");
                  },
                ),
              ),
              Divider(
                height: 30,
              ),
            ],
          )
        : SizedBox.shrink();
  }
}
