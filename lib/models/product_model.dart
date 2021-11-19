import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String? productId;
  final String? productName;
  final double? price;
  final String? description;
  final String? images;
  final bool? isAvailable;
  final String? quantity;
  final double? latitude;
  final double? longitude;
  final String? location;

  ProductModel(
      {this.productId,
      this.productName,
      this.price,
      this.description,
      this.images,
      this.isAvailable,
      this.quantity,
      this.latitude,
      this.longitude,
      this.location});

  List<ProductModel> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> dataMap =
          snapshot.data() as Map<String, dynamic>;

      return ProductModel(
        productId: dataMap['productId'],
        productName: dataMap['productName'],
        price: dataMap['price'],
        description: dataMap['description'],
        images: dataMap['images'][0],
        isAvailable: dataMap['isAvailable'],
        quantity: dataMap['quantity'],
        latitude: dataMap['latitude'],
        longitude: dataMap['longitude'],
        location: dataMap['location'],
      );
    }).toList();
  }
}

// class ProductModel {
//   static const PRODUCTID = "productId";
//   static const IMAGES = "images";
//   static const PRODUCTNAME = "productName";
//   static const DESCRIPTION = "description";
//   static const PRICE = "price";
//   static const ISAVAILABLE = "isAvailable";
//   static const QUANTITY = "quantity";
//   static const LATITUDE = "latitude";
//   static const LONGITUDE = "longitude";
//   static const LOCATION = "location";

//   late String _productId;
//   late String _productName;
//   late double _price;
//   late String _description;
//   late String _images;
//   late bool _isAvailable;
//   late String _quantity;
//   late double _latitude;
//   late double _longitude;
//   late String _location;

//   // ProductModel({
//   //   required this.id,
//   //   required this.productName,
//   //   required this.price,
//   //   required this.description,
//   //   required this.imagesUrl,
//   //   required this.isAvailable,
//   //   required this.quantity,
//   //   required this.latitude,
//   //   required this.longitude,
//   //   required this.location,
//   // });

//   //getters

//   String get id => _productId;
//   String get productName => _productName;
//   double get price => _price;
//   String get description => _description;
//   String get images => _images;
//   bool get isAvailable => _isAvailable;
//   String get quantity => _quantity;
//   double get latitude => _latitude;
//   double get longitude => _longitude;
//   String get location => _location;

//   ProductModel.fromMap(Map<String, dynamic> data) {
//     // Map data = snapshot.data as Map;
//     _productId = data[PRODUCTID];
//     _productName = data[PRODUCTNAME];
//     _description = data[DESCRIPTION];
//     _price = data[PRICE];
//     _images = data[IMAGES];
//     _isAvailable = data[ISAVAILABLE];
//     _quantity = data[QUANTITY];
//     _latitude = data[LATITUDE];
//     _longitude = data[LONGITUDE];
//     _location = data[LOCATION];
//   }
// }
