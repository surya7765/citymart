import 'package:citymart/views/product_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

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
                        latitude: document.get('latitude'),
                        longitude: document.get('longitude'),
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
                          height: 140,
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
}
