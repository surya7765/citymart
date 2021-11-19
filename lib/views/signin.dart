import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:citymart/services/auth.dart';
import 'package:citymart/views/sellers.dart';
import 'package:citymart/views/signup.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formkey = GlobalKey<FormState>();
  late String email, password;

  TextEditingController emailcontroller = TextEditingController();

  AuthServices authServices = AuthServices();

  bool _isLoading = false;

  

  userLogin() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authServices.signIn(email, password).then((value) {
        if (value != null) {
          setState(() {
            _isLoading = false;
          });
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SellerPage()));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          backgroundColor: Colors.grey,
          elevation: 0.0,
          brightness: Brightness.dark,
          centerTitle: true,
        ),
        body: _isLoading
            ? Container(
                child: Center(child: CircularProgressIndicator()),
              )
            : Form(
                key: _formkey,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: <Widget>[
                      Spacer(),
                      TextFormField(
                        validator: (val) {
                          return val!.isEmpty ? "Enter Email" : null;
                        },
                        controller: emailcontroller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.indigo, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          hintText: "example@gmail.com",
                          hintStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 18.0,
                          ),
                        ),
                        onChanged: (val) {
                          email = val;
                        },
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        validator: (val) {
                          return val!.isEmpty ? "Enter Password" : null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.indigo, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          hintText: "Password@123",
                          hintStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 18.0,
                          ),
                        ),
                        onChanged: (val) {
                          password = val;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      GestureDetector(
                        onTap: () async {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString('email', emailcontroller.text);
                          userLogin();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          height: 50.0,
                          alignment: Alignment.center,
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
