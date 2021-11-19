import 'dart:io';
import 'package:citymart/services/upload_product.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  Color white = Colors.white;
  Color black = Colors.black;
  Color grey = Colors.grey;
  Color red = Colors.red;
  Color amber = Colors.amber;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController productNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController productDescController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  ProductService productService = ProductService();
  final ImagePicker _picker = ImagePicker();

  late Position _currentPosition;
  String _currentAddress = '';

  void _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: "Make sure your location is enabled.");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: 'Location permissions are denied forever');
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];

      setState(() {
        _currentPosition = position;
        _currentAddress =
            "${place.locality}, ${place.administrativeArea}\n ${place.country}, ${place.postalCode}";
      });
    } catch (e) {
      print(e);
      Fluttertoast.showToast(msg: "No internet connection");
    }
  }

  void hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty)
        Fluttertoast.showToast(msg: "connected to city mart");
    } on SocketException catch (_) {
      Fluttertoast.showToast(msg: "No internet connection");
    }
  }

  bool isLoading = false;

  File? _image1;
  File? _image2;
  File? _image3;

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.close,
              color: black,
            ),
          ),
          title: Text("Add product", style: TextStyle(color: black))),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Form(
          key: _formKey,
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              // ignore: deprecated_member_use
                              child: OutlineButton(
                                borderSide: BorderSide(
                                  color: grey.withOpacity(0.6),
                                  width: 2.0,
                                ),
                                onPressed: () {
                                  _selectImage(
                                      _picker.pickImage(
                                          source: ImageSource.gallery),
                                      1);
                                },
                                child: _displayImage1(),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: OutlineButton(
                                borderSide: BorderSide(
                                  color: grey.withOpacity(0.6),
                                  width: 2.0,
                                ),
                                onPressed: () {
                                  _selectImage(
                                      _picker.pickImage(
                                          source: ImageSource.gallery),
                                      2);
                                },
                                child: _displayImage2(),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              // ignore: deprecated_member_use
                              child: OutlineButton(
                                borderSide: BorderSide(
                                  color: grey.withOpacity(0.6),
                                  width: 2.0,
                                ),
                                onPressed: () {
                                  _selectImage(
                                      _picker.pickImage(
                                          source: ImageSource.gallery),
                                      3);
                                },
                                child: _displayImage3(),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Enter Product name with not more than 10 characters",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: red,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: productNameController,
                          decoration: InputDecoration(hintText: "Product Name"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'You must enter a name';
                            } else if (value.length > 20) {
                              return 'Cannot be more than 20 letters';
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: priceController,
                          keyboardType: TextInputType.number,
                          decoration:
                              InputDecoration(hintText: "Product Price"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Price value please';
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: quantityController,
                          decoration: InputDecoration(hintText: "Quantity"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter quantity please';
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: productDescController,
                          decoration:
                              InputDecoration(hintText: "Product Description"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Description please';
                            }
                          },
                        ),
                      ),
                      ListTile(
                        leading: Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        trailing: Text("Product Availability"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          children: [
                            Text(_currentAddress),
                            SizedBox(
                              height: 30,
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.location_on_rounded,
                                color: white,
                              ),
                              onPressed: () {
                                _getCurrentLocation();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => validateAndUpload(),
        child: Icon(Icons.upload),
      ),
    );
  }

  void _selectImage(Future<XFile?> pickImage, int imageNumber) async {
    XFile? tempImage = (await pickImage);
    switch (imageNumber) {
      case 1:
        setState(() {
          _image1 = File(tempImage!.path);
        });
        break;
      case 2:
        setState(() {
          _image2 = File(tempImage!.path);
        });
        break;
      case 3:
        setState(() {
          _image3 = File(tempImage!.path);
        });
        break;
      default:
    }
  }

  Widget _displayImage1() {
    if (_image1 != null) {
      return Image.file(
        _image1!,
        fit: BoxFit.fill,
        width: double.infinity,
        height: 100,
      );
    } else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 30.0),
        child: new Icon(
          Icons.add,
          color: grey,
        ),
      );
    }
  }

  Widget _displayImage2() {
    if (_image2 != null) {
      return Image.file(
        _image2!,
        fit: BoxFit.fill,
        width: double.infinity,
        height: 100,
      );
    } else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 30.0),
        child: new Icon(
          Icons.add,
          color: grey,
        ),
      );
    }
  }

  Widget _displayImage3() {
    if (_image3 != null) {
      return Image.file(
        _image3!,
        fit: BoxFit.fill,
        width: double.infinity,
        height: 100,
      );
    } else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 30.0),
        child: new Icon(
          Icons.add,
          color: grey,
        ),
      );
    }
  }

  void validateAndUpload() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      if (_image1 != null && _image2 != null && _image3 != null) {
        String imageUrl1;
        String imageUrl2;
        String imageUrl3;

        final FirebaseStorage storage = FirebaseStorage.instance;
        final String picture1 =
            '1${DateTime.now().millisecondsSinceEpoch.toString()}.jpg';
        UploadTask uploadTask1 =
            storage.ref().child(picture1).putFile(_image1!);
        final String picture2 =
            '2${DateTime.now().millisecondsSinceEpoch.toString()}.jpg';
        UploadTask uploadTask2 =
            storage.ref().child(picture2).putFile(_image2!);
        final String picture3 =
            '3${DateTime.now().millisecondsSinceEpoch.toString()}.jpg';
        UploadTask uploadTask3 =
            storage.ref().child(picture3).putFile(_image3!);
        TaskSnapshot snapshot1 = await uploadTask1;
        TaskSnapshot snapshot2 = await uploadTask2;

        uploadTask3.then((snapshot3) async {
          imageUrl1 = await snapshot1.ref.getDownloadURL();
          imageUrl2 = await snapshot2.ref.getDownloadURL();
          imageUrl3 = await snapshot3.ref.getDownloadURL();
          List<String> imageList = [imageUrl1, imageUrl2, imageUrl3];

          productService.uploadProduct(
            productName: productNameController.text,
            price: double.parse(priceController.text),
            description: productDescController.text,
            images: imageList,
            isAvailable: isChecked,
            quantity: quantityController.text,
            latitude: _currentPosition.latitude,
            longitude: _currentPosition.longitude,
            location: _currentAddress,
          );
        });
        _formKey.currentState!.reset();
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(msg: 'product added successfully');
        Navigator.pop(context);
        // uploadImages();
      } else {
        setState(() {
          isLoading = false;
        });
        Get.snackbar(
          "Error",
          "Please select all images",
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.red,
          dismissDirection: SnackDismissDirection.HORIZONTAL,
          icon: Icon(
            Icons.error,
            color: Colors.red,
          ),
        );
      }
    } else {
      setState(() {
        isLoading = false;
      });
      Get.snackbar(
        "Error",
        "Please fill all the fields",
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.red,
        dismissDirection: SnackDismissDirection.HORIZONTAL,
      );
    }
  }
}
