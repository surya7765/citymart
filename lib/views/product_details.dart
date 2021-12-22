import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ProductDetails extends StatelessWidget {
  final String productId;
  final String productName;
  final double price;
  final String description;
  final String images1;
  final String images2;
  final String images3;
  final bool isAvailable;
  final String quantity;
  final double distance;
  final String location;

  const ProductDetails({
    Key? key,
    required this.productId,
    required this.productName,
    required this.price,
    required this.description,
    required this.images1,
    required this.images2,
    required this.images3,
    required this.isAvailable,
    required this.quantity,
    required this.distance,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(productName),
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
                    tag: productId,
                    child: ImageSlideshow(
                      width: double.infinity,
                      height: 400,
                      initialPage: 0,
                      indicatorColor: Colors.blue,
                      indicatorBackgroundColor: Colors.grey,
                      autoPlayInterval: 3000,
                      isLoop: true,
                      children: [
                        Image.network(images1),
                        Image.network(images2),
                        Image.network(images3),
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
                    description,
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
                        "\t \t Rs. " + price.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "\t \t " + quantity.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                      isAvailable
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(double.parse((distance).toStringAsFixed(2))
                              .toString() +
                          " km"),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(left: 40, top: 10),
                  child: Container(
                    child: Text(location),
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
