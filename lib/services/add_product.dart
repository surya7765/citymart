import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:convert';

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

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            leading: Icon(
              Icons.close,
              color: black,
            ),
            title: Text("add product", style: TextStyle(color: black))),
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
                        onPressed: () {},
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 30.0),
                          child: new Icon(
                            Icons.add,
                            color: grey,
                          ),
                        ),
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
                        onPressed: () {},
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 30.0),
                          child: new Icon(
                            Icons.add,
                            color: grey,
                          ),
                        ),
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
                        onPressed: () {},
                        child: Padding(
                          padding:
                              const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 30.0),
                          child: new Icon(
                            Icons.add,
                            color: grey,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Enter Product name with not more thsn 10 characters",
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
}
