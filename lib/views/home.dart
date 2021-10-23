import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:io';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Position _currentPosition;
  String _currentAddress = "Enabling Location...";

  void _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: "Make sure your location is enabled.");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: 'Location permissions are denied forever');
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];

      setState(() {
        _currentPosition = position;
        _currentAddress =
            "${place.locality}, ${place.administrativeArea}\n ${place.country}, ${place.postalCode}";
      });
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: "No internet connection");
    }
  }

  void hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty)
        Fluttertoast.showToast(msg: "connected");
    } on SocketException catch (_) {
      Fluttertoast.showToast(msg: "No internet connection");
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              hasNetwork();
              _determinePosition();
            },
            child: Icon(Icons.my_location_rounded),
          ),
          title: Text(
            _currentAddress,
            style: TextStyle(
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.shopping_bag_rounded),
                text: "Products",
              ),
              Tab(
                icon: Icon(Icons.miscellaneous_services),
                text: "Services",
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: GestureDetector(
                child: Icon(Icons.search_rounded),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(title: Text('Home'), icon: Icon(Icons.home)),
            BottomNavyBarItem(
                title: Text('Chat'), icon: Icon(Icons.chat_bubble)),
            BottomNavyBarItem(
                title: Text('Seller'), icon: Icon(Icons.shopping_bag_outlined)),
            BottomNavyBarItem(
                title: Text('Profile'),
                icon: Icon(Icons.person_outline_rounded)),
          ],
        ),
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: <Widget>[
              Container(
                color: Colors.blueGrey,
              ),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.green,
              ),
              Container(
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
