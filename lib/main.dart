import 'package:demo_nav_bar/Page/FirstPage.dart';
import 'package:demo_nav_bar/Page/FourPage.dart';
import 'package:demo_nav_bar/Page/SecondPage.dart';
import 'package:demo_nav_bar/Page/ThirdPage.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
      home: const MyHomePage(title: 'Demo bottom navigation bar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _page = <Widget>[
    FirstPage(),
    SecondPage(),
    ThirdPage(),
    FourPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _page.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(child: GNav(
            rippleColor: Colors.green[300]!, // color khi click vao
            hoverColor: Colors.green[100]!, // mau hover
            gap: 8, // khoang cach giua text va icon
            activeColor: Colors.orange, // mau tab duoc chon
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // navigation bar padding
            duration: Duration(milliseconds: 900),
            tabBackgroundColor: Colors.orange[100]!, // mau back tab khi duoc chon
            color: Colors.grey[800], // mau icon khi chua dc chon
            tabBorderRadius: 15, // border tab
            // tabBorder: Border.all(color: Colors.grey, width: 1), // tab button border
            // tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)],
            // curve: Curves.easeOutExpo,
            haptic: true,
            tabs: [
              GButton(
              text: "Home", icon: Icons.home,),
              GButton(
                text: "Likes", icon: Icons.heart_broken,),
              GButton(
                text: "Search", icon: Icons.search,),
              GButton(
                text: "Profile", icon: Icons.supervised_user_circle,),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
                print(index);
              });
            },
          )
          ),
        ),
      ),
    );
  }
}
