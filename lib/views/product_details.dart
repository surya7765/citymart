import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ProductDetails extends StatelessWidget {
  final List item;
  final int index;
  const ProductDetails({Key? key, required this.item, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(item[index]["productName"]),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  child: Hero(
                    transitionOnUserGestures: true,
                    tag: index,
                    child: ImageSlideshow(
                      width: double.infinity,
                      height: 400,
                      initialPage: 0,
                      indicatorColor: Colors.blue,
                      indicatorBackgroundColor: Colors.grey,
                      autoPlayInterval: 3000,
                      isLoop: true,
                      children: [
                        Image.network(item[index]["images"][0]),
                        Image.network(item[index]["images"][1]),
                        Image.network(item[index]["images"][2]),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    item[index]["productDesc"],
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "\t \t Rs. " + item[index]["price"].toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "\t \t Rs. " + item[index]["quantity"].toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                      item[index]["availability"]
                          ? Text(
                              "Available",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.green),
                            )
                          : Text(
                              "Unavailable",
                              style: TextStyle(fontSize: 16, color: Colors.red),
                            ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                    top: 8,
                  ),
                  child: Row(
                    children: [
                      Text(item[index]["ratings"].toString()),
                      SizedBox(
                        width: 6,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 40, top: 10),
                  child: Container(
                    child: Text(item[index]["address"]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
