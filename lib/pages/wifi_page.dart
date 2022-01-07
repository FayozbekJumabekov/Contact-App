import 'package:flutter/material.dart';

class WiFiPage extends StatefulWidget {
  const WiFiPage({Key? key}) : super(key: key);

  static final String id = "wifi_page";

  @override
  _WiFiPageState createState() => _WiFiPageState();
}

class _WiFiPageState extends State<WiFiPage> {
  bool isSwitched = false;
  bool indicator = false;

  List<String> wifiList = [
    "Alibaba",
    "Microsoft",
    "Redmi Note 9S",
    "Samsung Galaxy A71",
    "PDP Academy 5G"
  ];

  Future<void> _viewIndicator() async {
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      indicator = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Switch WiFi"),
        actions: [
          Switch(
            onChanged: (value) {
              if (!isSwitched) {
                setState(() {
                  isSwitched = true;
                  indicator = true;
                  _viewIndicator();
                });
              } else
                setState(() {
                  isSwitched = false;
                  indicator = false;
                });
            },
            value: isSwitched,
            activeColor: Colors.black,
            activeTrackColor: Colors.white,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.black,
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: indicator
          ? Container(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Available networks : ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                      margin: EdgeInsets.only(right: 30),
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        backgroundColor:
                            (indicator) ? Colors.white : Colors.black,
                        color: Colors.black,
                      )),
                ],
              ),
            )
          : Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Available networks : ",
                        style: TextStyle(fontSize: 20),
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 30),
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.black,
                            color: Colors.black,
                          )),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 70),
                  width: MediaQuery.of(context).size.width,
                  child: (isSwitched)
                      ? ListView.builder(
                          itemCount: wifiList.length,
                          itemBuilder: (context, index) {
                            return card(index);
                          })
                      : SizedBox.shrink(),
                ),
              ],
            ),
    );
  }

  Widget card(int index) {
    return Column(
      children: [
        Divider(),
        Card(
            margin: EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 5),
            elevation: 0,
            child: ListTile(
              leading: Icon(
                Icons.wifi,
                color: Colors.black,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(wifiList[index]),
                  Icon(
                    (index.isOdd) ? (Icons.lock) : (Icons.lock_open),
                    size: 18,
                  )
                ],
              ),
              trailing: Container(
                alignment: Alignment.center,
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(50)),
                child: Icon(Icons.keyboard_arrow_right),
              ),
            )),
      ],
    );
  }
}
