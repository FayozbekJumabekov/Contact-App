import 'package:flutter/material.dart';
import 'package:widget_catalog/pages/contacts_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:widget_catalog/pages/phone_page.dart';

class PageViewPage extends StatefulWidget {
  const PageViewPage({Key? key}) : super(key: key);

  static final String id = "pageview_page";

  @override
  _PageViewPageState createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  List<Color> colorList = Colors.accents;

  PageController _pageController = PageController();
  int _selectedPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _askPermissions(null);
    _pageController = PageController(initialPage: 0);
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
      body: PageView(
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        children: [PhonePage(), ContactPage()],
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
            icon: Icon(Icons.contacts,),
            label: 'Contacts',
          ),
        ],
      ),
    );
  }
}
