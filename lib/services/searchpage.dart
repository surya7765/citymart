import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:citymart/views/product_details.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:math' as Math;

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late Position _currentPosition = Position(
    latitude: 0,
    longitude: 0,
    accuracy: 0,
    altitude: 0,
    speed: 0,
    heading: 0,
    speedAccuracy: 0,
    timestamp: null,
  );
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

  TextEditingController _searchController = TextEditingController();
  CollectionReference _productsCollection =
      FirebaseFirestore.instance.collection('products');
  String query = '';

  @override
  Widget build(BuildContext context) {
    _determinePosition();
    return Scaffold(
      appBar: AppBar(
        title: Text("Search for product"),
        actions: [
          AnimSearchBar(
            width: 360,
            color: Colors.grey[700],
            helpText: "Type to search",
            textController: _searchController,
            onSuffixTap: () {
              setState(() {
                query = _searchController.text;
              });
            },
            suffixIcon: Icon(Icons.search),
          )
        ],
      ),
      body: _searchController.text.isEmpty
          ? Center(
              child: Text('Search product will appear here'),
            )
          : GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: StreamBuilder<QuerySnapshot>(
                stream: _productsCollection.snapshots().asBroadcastStream(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  // print(query);
                  // final products = snapshot.data!.docs;
                  else {
                    if (snapshot.data!.docs
                        .where((QueryDocumentSnapshot<Object?> element) =>
                            element['productName']
                                .toString()
                                .toLowerCase()
                                .contains(query.toLowerCase()))
                        .isEmpty) {
                      return Center(
                        child: Text('No product found'),
                      );
                    } else {
                      return ListView(
                        children: [
                          ...snapshot.data!.docs
                              .where((QueryDocumentSnapshot<Object?> element) =>
                                  element['productName']
                                      .toString()
                                      .toLowerCase()
                                      .contains(query.toLowerCase()))
                              .map(
                            (QueryDocumentSnapshot<Object?> data) {
                              final String productName =
                                  data.get('productName');
                              final String imageUrl = data['images'][0];
                              final String shopname = data.get('shopname');
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetails(
                                        productId: data.get('productId'),
                                        productName: data.get('productName'),
                                        price: data.get('price'),
                                        description: data.get('description'),
                                        images1: data.get('images')[0],
                                        images2: data.get('images')[1],
                                        images3: data.get('images')[2],
                                        isAvailable: data.get('isAvailable'),
                                        quantity: data.get('quantity'),
                                        distance: getDistanceFromLatLonInKm(
                                          _currentPosition.latitude,
                                          _currentPosition.longitude,
                                          data.get('latitude'),
                                          data.get('longitude'),
                                        ),
                                        location: data.get('location'),
                                      ),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  title: Text(productName),
                                  subtitle: Text(shopname),
                                  leading: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(imageUrl),
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      );
                    }
                  }
                },
              ),
            ),
    );
  }

  double getDistanceFromLatLonInKm(lat1, lon1, lat2, lon2) {
    var R = 6371; // Radius of the earth in km
    var dLat = deg2rad(lat2 - lat1); // deg2rad below
    var dLon = deg2rad(lon2 - lon1);
    var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
        Math.cos(deg2rad(lat1)) *
            Math.cos(deg2rad(lat2)) *
            Math.sin(dLon / 2) *
            Math.sin(dLon / 2);
    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    var d = R * c; // Distance in km
    return d;
  }

  double deg2rad(deg) {
    return deg * (Math.pi / 180);
  }
}
