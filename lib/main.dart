import 'package:flutter/material.dart';
import 'package:weekfood/pages/dashboard.dart';
import 'package:weekfood/pages/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:weekfood/pages/settings.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  final items = const [
    Icon(Icons.home, size: 30),
    Icon(Icons.settings, size: 30),
    Icon(Icons.person_rounded, size: 30),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FoodPlan"),
        titleSpacing: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            SizedBox(
              height: 120,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.blueAccent),
                child: Text(
                  "Hello",
                  style: TextStyle(fontSize: 24),
                  ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blueAccent,
        child: getSelectedWidget(index : index),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 300),
        animationCurve: Curves.ease,
        items: items,
        index: index,
        onTap: (selectedIndex) {
          debugPrint("Curent index is $selectedIndex");
          setState(() {
            index = selectedIndex;
          });
        },
      ),
    );
  }
  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch(index) {
      case 0:
        widget = const Dashboard();
        break;
      case 1:
        widget = const Settings();
        break;
      case 2:
        widget = const Profile();
        break;
      default:
        widget = const Dashboard();
        break;
    }
    return widget;
  }
}