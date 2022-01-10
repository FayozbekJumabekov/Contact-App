import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogandDrawerPage extends StatefulWidget {
  const DialogandDrawerPage({Key? key}) : super(key: key);
  static final String id = "dialog_and_drawer_page";

  @override
  _DialogandDrawerPageState createState() => _DialogandDrawerPageState();
}

class _DialogandDrawerPageState extends State<DialogandDrawerPage> {
  void _displayDialog() {
    if (Platform.isIOS) {
      _iosDialog();
    } else
      _androidDialog();
  }

  // iPhone dialog
  void _iosDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text("Log out"),
            // backgroundColor: Colors.blue[50],
            content: Text("Are you sure, you want to log out ?"),
            actions: [
              CupertinoDialogAction(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              CupertinoDialogAction(child: Text("Confirm"))
            ],
          );
        });
  }

  // android dialog
  void _androidDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Log out"),
            backgroundColor: Colors.blue[50],
            content: Text("Are you sure, you want to log out ?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              TextButton(onPressed: () {}, child: Text("Confirm"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Drawer and Dialog"),
          leading: Builder(builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    primary: Colors.blueAccent,
                    minimumSize: Size(200, 50)),
                onPressed: () {
                  _androidDialog();
                },
                child: Text("Android Dialog"),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    primary: Colors.blueAccent,
                    minimumSize: Size(200, 50)),
                onPressed: () {
                  _iosDialog();
                },
                child: Text("iOS Dialog"),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    primary: Colors.blueAccent,
                    minimumSize: Size(200, 50)),
                onPressed: () {
                  _displayDialog();
                },
                child: Text("Mixed Dialog"),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            children: [
              const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/images/im_avatar.png"),
                ),
                accountName: Text(
                  "Michael Clerk",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("Michel@gmail.com"),
              ),
              ListTile(
                textColor: Colors.blue,
                leading: Icon(
                  Icons.home,
                  size: 30,
                  color: Colors.blue,
                ),
                title: Text("Home"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                  size: 30,
                ),
                title: Text("Profile"),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(
                  Icons.message,
                  size: 28,
                ),
                title: Text("Abouts"),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
