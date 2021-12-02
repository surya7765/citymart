import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:citymart/views/product_details.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  CollectionReference _productsCollection =
      FirebaseFirestore.instance.collection('products');
  String query = '';

  @override
  Widget build(BuildContext context) {
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
                                        latitude: data.get('latitude'),
                                        longitude: data.get('longitude'),
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
}
