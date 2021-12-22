import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math' as Math;
import 'package:citymart/views/product_details.dart';

class Body extends StatefulWidget {
  final double user_lat;
  final double user_long;

  const Body({Key? key, required this.user_lat, required this.user_long})
      : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('products')
          .orderBy('price')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return GridView(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          children: snapshot.data!.docs.map(
            (document) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetails(
                        productId: document.get('productId'),
                        productName: document.get('productName'),
                        price: document.get('price'),
                        description: document.get('description'),
                        images1: document.get('images')[0],
                        images2: document.get('images')[1],
                        images3: document.get('images')[2],
                        isAvailable: document.get('isAvailable'),
                        quantity: document.get('quantity'),
                        distance: getDistanceFromLatLonInKm(
                          widget.user_lat,
                          widget.user_long,
                          document.get('latitude'),
                          document.get('longitude'),
                        ),
                        location: document.get('location'),
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: 2,
                  child: Column(
                    children: <Widget>[
                      Hero(
                        transitionOnUserGestures: true,
                        tag: document.id,
                        child: Image.network(
                          document.get('images')[0],
                          fit: BoxFit.cover,
                          height: 136,
                          width: 150,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        document['productName'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '\u{20B9}${document['price']}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ).toList(),
        );
      },
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
