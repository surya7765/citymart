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

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/stores.json');
    final data = await json.decode(response);
    // print(data);
    // setState(() {
    _items = data["shoplist"];
  }

  @override
  Widget build(BuildContext context) {
    readJson();
    return Container(
      child: GridView.builder(
          itemCount: _items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Image(
                  image: NetworkImage(
                    _items[index]["productdetails"][0]["image"][0],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
