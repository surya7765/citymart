import 'package:citymart/src/screens/home_screen.dart';
import 'package:citymart/views/homepage_body.dart';
import 'package:citymart/views/refer_earn.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty)
        Fluttertoast.showToast(msg: "connected to city mart");
    } on SocketException catch (_) {
      Fluttertoast.showToast(msg: "No internet connection");
    }
  }

  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              hasNetwork();
              _determinePosition();
            },
            icon: Icon(Icons.my_location_rounded),
          ),
          title: GestureDetector(
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              )
            },
            child: Text(
              _currentAddress,
              style: TextStyle(
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.shopping_cart_outlined),
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
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReferEarn()),
                  );
                },
                icon: Icon(
                  Icons.share_rounded,
                ),
              ),
            )
          ],
        ),
        body: TabBarView(
          children: [
            Body(),
            Text("data"),
          ],
        ),
      ),
    );
  }
}
