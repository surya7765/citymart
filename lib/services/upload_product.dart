import 'package:citymart/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class ProductService {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? currentUser = AuthServices().getCurrentUser();

  String ref = 'products';

  void uploadProduct({
    required String productName,
    required double price,
    required String description,
    required List images,
    required bool isAvailable,
    required String quantity,
    required String shopname,
    required double latitude,
    required double longitude,
    required String location,
  }) {
    var id = Uuid();
    String productId = id.v1();

    _firestore.collection(ref).doc(productId).set({
      'productId': productId,
      'productName': productName,
      'price': price,
      'description': description,
      'images': images,
      'isAvailable': isAvailable,
      'quantity': quantity,
      'shopname': shopname,
      'latitude': latitude,
      'longitude': longitude,
      'location': location,
      'user': currentUser,
    });
  }
}
