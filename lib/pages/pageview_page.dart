import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:widget_catalog/pages/contact_access_page.dart';
import 'package:permission_handler/permission_handler.dart';

class PageViewPage extends StatefulWidget {
  const PageViewPage({Key? key}) : super(key: key);

  static final String id = "pageview_page";

  @override
  _PageViewPageState createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  List<Color> colorList = Colors.accents;

  List<Contact> contactList = [
    Contact("Ilhomjon", "+998945096336"),
    Contact("Javlon aka", "+998901234567"),
    Contact("Doniyor", "+9989300000000"),
    Contact("Mansurbek", "+998914747474"),
    Contact("Sanjar aka", "+9989341000140"),
    Contact("Sardorbek", "+99896547841"),
    Contact("Shaxriyor", "+998911122767"),
    Contact("My number", "+998930000342"),
  ];

  PageController _pageController = PageController();
  int _selectedPage = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _askPermissions(null);
    _pageController = PageController(initialPage: 1);
  } //Check contacts permission

  Future<void> _askPermissions(String? routeName) async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      if (routeName != null) {
        Navigator.of(context).pushReplacementNamed(routeName);
      }
    } else {
      _handleInvalidPermissions(permissionStatus);
    }
  }

  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.permanentlyDenied) {
      PermissionStatus permissionStatus = await Permission.contacts.request();
      return permissionStatus;
    } else {
      return permission;
    }
  }

  void _handleInvalidPermissions(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.denied) {
      final snackBar = SnackBar(content: Text('Access to contact data denied'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (permissionStatus == PermissionStatus.permanentlyDenied) {
      final snackBar =
          SnackBar(content: Text('Contact data not available on device'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (_selectedPage == 1) ? Text("Home") : Text("Contacts"),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: contactList.length,
                  itemBuilder: (context, index) {
                    return contact_Item(index);
                  })),
          home(),
          ContactAccessPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 100), curve: Curves.easeIn);
          });
        },

        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        selectedIconTheme: IconThemeData(color: Colors.blue),
        //type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'Phone',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Contacts',
          ),
        ],
      ),
    );
  }

  Widget contact_Item(int index) {
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

  Widget home() {
    return Center(
      child: Container(
        child: Text(
          "Home",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class Contact {
  String name;
  String phone;

  Contact(this.name, this.phone);
}
