import 'package:citymart/views/product_details.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List _items = [];
  List _items1 = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/stores.json', cache: false);
    final data = await json.decode(response);
    // _items1 = data["shoplist"];
    _items = data["shoplist"][1]["productdetails"];
  }

  @override
  Widget build(BuildContext context) {
    readJson();
    return Container(
      // height: 200,
      child: GridView.builder(
        itemCount: _items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 0),
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ProductDetails(item: _items, index: index)),
              ),
              child: Container(
                child: Column(
                  children: [
                    Hero(
                      transitionOnUserGestures: true,
                      tag: index,
                      child: Container(
                        height: 130,
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(_items[index]["images"][0]),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      _items[index]["productName"],
                      overflow: TextOverflow.ellipsis,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Row(
                        children: [
                          Text("\t" + _items[index]["quantity"].toString()),
                          Text("\t : \t Rs. " +
                              _items[index]["price"].toString()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
