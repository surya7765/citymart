// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:get/get.dart';

// class ProductsController extends GetxController {
//   Future getData(String category) async {
//     QuerySnapshot snapshot =
//         await FirebaseFirestore.instance.collection(category).get();
//     return snapshot.docs;
//   }

//   @override
//   onReady() {
//     super.onReady();
//   }
// }

// class ProductServices {
//   String collection = 'products';

//   FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<List<ProductModel>> getProducts() async =>
//       _firestore.collection(collection).get().then((value) {
//         List<ProductModel> products = [];
//         value.docs.forEach((element) {
//           products.add(ProductModel.fromMap(element.data()));
//         });
//         return products;
//       });
    // _firestore.collection(collection).get().then((snap) {
      
    //   List<ProductModel> products = [];
    //   snap.docs.map((snapshot) => products.add(ProductModel.fromSnapshot(snapshot)));
    //   return products;
    // });
  
// }
