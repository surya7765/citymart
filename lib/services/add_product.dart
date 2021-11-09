import 'dart:io';

import 'package:flutter/material.dart';
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
  final ImagePicker _picker = ImagePicker();

  late File _image1;
  late File _image2;
  late File _image3;

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
        body: Form(
          key: _formKey,
          child: ListView(
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
                              _picker.pickImage(source: ImageSource.gallery),
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
                              _picker.pickImage(source: ImageSource.gallery),
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
                              _picker.pickImage(source: ImageSource.gallery),
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
                    } else if (value.length > 10) {
                      return 'Cannot be more than 10 letters';
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: priceController,
                  decoration: InputDecoration(hintText: "Product Price"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Price value please';
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
            ],
          ),
        ));
  }

  void _selectImage(Future<XFile?> pickImage, int imageNumber) async {
    File tempImage = (await pickImage) as File;
    print(tempImage.toString());
    switch (imageNumber) {
      case 1:
        setState(() {
          _image1 = tempImage;
        });
        break;
      case 2:
        setState(() {
          _image2 = tempImage;
        });
        break;
      case 3:
        setState(() {
          _image3 = tempImage;
        });
        break;
      default:
    }
  }

  Widget _displayImage1() {
    if (_image1.path.length > 0) {
      return Image.file(
        _image1,
        fit: BoxFit.fill,
        width: 100,
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
    if (_image2.path.length > 0) {
      return Image.file(
        _image2,
        fit: BoxFit.fill,
        width: 100,
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
    if (_image3.path.length > 0) {
      return Image.file(
        _image3,
        fit: BoxFit.fill,
        width: 100,
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
}
