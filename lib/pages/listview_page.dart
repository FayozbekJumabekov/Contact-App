import 'package:flutter/material.dart';

class ListviewPage extends StatefulWidget {
  const ListviewPage({Key? key}) : super(key: key);

  static final String id = "listview_page";

  @override
  _ListviewPageState createState() => _ListviewPageState();
}

class _ListviewPageState extends State<ListviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Messages"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            Card(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              elevation: 0,
              child: ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/img.png"),
                      )),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Laurent"),
                    SizedBox(
                      width: 15,
                    ),
                    Text("20:18",
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                subtitle: Text(
                  "How about meeting tomorrow?",
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  size: 30,
                ),
              ),
            ),
            Divider(),
            Card(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              elevation: 0,
              child: ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/img_1.png"),
                      )),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Tracy"),
                    SizedBox(
                      width: 15,
                    ),
                    Text("19:22",
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                subtitle: Text(
                  "Flutter is just release1.0 oficially.",
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  size: 30,
                ),
              ),
            ),
            Divider(),
            Card(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              elevation: 0,
              child: ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/img_2.png"),
                      )),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Claire"),
                    SizedBox(
                      width: 15,
                    ),
                    Text("14:34",
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                subtitle: Text(
                  "I was not aware of that. Let me check",
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  size: 30,
                ),
              ),
            ),
            Divider(),
            Card(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              elevation: 0,
              child: ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/img_3.png"),
                      )),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Lisa"),
                    SizedBox(
                      width: 15,
                    ),
                    Text("11:05",
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                subtitle: Text(
                  "I love that idea, It's great!",
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  size: 30,
                ),
              ),
            ),
            Divider(),
            Card(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              elevation: 0,
              child: ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/img_4.png"),
                      )),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Mark"),
                    SizedBox(
                      width: 15,
                    ),
                    Text("09:46",
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                subtitle: Text(
                  "It totally makes sense to get some extra day-off",
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  size: 30,
                ),
              ),
            ),
            Divider(),
            Card(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              elevation: 0,
              child: ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/img_5.png"),
                      )),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Julietta"),
                    SizedBox(
                      width: 15,
                    ),
                    Text("08:15",
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                subtitle: Text(
                  "It has been re-scheduled to next Saturday 7.30pm",
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  size: 30,
                ),
              ),
            ), Card(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              elevation: 0,
              child: ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/img.png"),
                      )),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Laurent"),
                    SizedBox(
                      width: 15,
                    ),
                    Text("20:18",
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                subtitle: Text(
                  "How about meeting tomorrow?",
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  size: 30,
                ),
              ),
            ),
            Divider(),
            Card(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              elevation: 0,
              child: ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/img_1.png"),
                      )),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Tracy"),
                    SizedBox(
                      width: 15,
                    ),
                    Text("19:22",
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                subtitle: Text(
                  "Flutter is just release1.0 oficially.",
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  size: 30,
                ),
              ),
            ),
            Divider(),
            Card(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              elevation: 0,
              child: ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/img_2.png"),
                      )),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Claire"),
                    SizedBox(
                      width: 15,
                    ),
                    Text("14:34",
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                subtitle: Text(
                  "I was not aware of that. Let me check",
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  size: 30,
                ),
              ),
            ),
            Divider(),
            Card(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              elevation: 0,
              child: ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/img_3.png"),
                      )),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Lisa"),
                    SizedBox(
                      width: 15,
                    ),
                    Text("11:05",
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                subtitle: Text(
                  "I love that idea, It's great!",
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  size: 30,
                ),
              ),
            ),
            Divider(),
            Card(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              elevation: 0,
              child: ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/img_4.png"),
                      )),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Mark"),
                    SizedBox(
                      width: 15,
                    ),
                    Text("09:46",
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                subtitle: Text(
                  "It totally makes sense to get some extra day-off",
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  size: 30,
                ),
              ),
            ),
            Divider(),
            Card(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              elevation: 0,
              child: ListTile(
                leading: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/img_5.png"),
                      )),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Julietta"),
                    SizedBox(
                      width: 15,
                    ),
                    Text("08:15",
                        style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
                subtitle: Text(
                  "It has been re-scheduled to next Saturday 7.30pm",
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
