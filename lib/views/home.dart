import 'dart:async';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:citymart/views/homepage.dart';
import 'package:citymart/views/profile.dart';
import 'package:citymart/services/searchpage.dart';
import 'package:citymart/views/sellers.dart';
import 'package:citymart/views/signin.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String finalemail = '';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future getValidationdata() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainemail = sharedPreferences.getString('email');
    setState(() {
      finalemail = obtainemail!;
    });
    return finalemail;
  }

  Widget page = finalemail.isEmpty ? SignIn() : SearchPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.white,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text('Home'), icon: Icon(Icons.home_outlined)),
          BottomNavyBarItem(title: Text('Search'), icon: Icon(Icons.search)),
          BottomNavyBarItem(
              title: Text('Seller'), icon: Icon(Icons.shopping_bag_outlined)),
          BottomNavyBarItem(
              title: Text('Profile'), icon: Icon(Icons.person_outline_rounded)),
        ],
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            print(index);
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            HomePage(),
            SearchPage(),
            page,
            ProfilePage(),
          ],
        ),
      ),
    );
  }
}
