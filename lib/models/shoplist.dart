class ShopList {
  ShopList({
    required this.shoplist,
  });

  List<Shoplist> shoplist;
}

class Shoplist {
  Shoplist({
    required this.name,
    required this.productdetails,
  });

  String name;
  List<Productdetail> productdetails;
}

class Productdetail {
  Productdetail({
    required this.productName,
    required this.productDesc,
    required this.price,
    required this.image,
    required this.quantity,
    required this.availability,
    required this.ratings,
    required this.address,
    required this.alternativeName,
    required this.images,
  });

  String productName;
  String productDesc;
  int price;
  List<String> image;
  String quantity;
  bool availability;
  double ratings;
  String address;
  List<String> alternativeName;
  List<String> images;
}
