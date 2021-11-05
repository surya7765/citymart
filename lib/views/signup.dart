import 'package:citymart/views/signin.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  late String name, email, password;

  bool _isLoading = false;

  // AuthServices authServices = AuthServices();

  // userSignUp() async {
  //   if (_formkey.currentState.validate()) {
  //     setState(() {
  //       _isLoading = true;
  //     });
  //     await authServices.register(email, password).then((value) {
  //       if (value != null) {
  //         setState(() {
  //           _isLoading = false;
  //         });
  //         Navigator.pushReplacement(
  //             context, MaterialPageRoute(builder: (context) => Home()));
  //       }
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text("Login"),
          backgroundColor: Colors.black,
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
                          return val!.isEmpty ? "Enter Name" : null;
                        },
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
                          hintText: "Enter your name",
                          hintStyle: TextStyle(
                            color: Colors.blueGrey,
                          ),
                          labelText: "Name",
                          labelStyle: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: 18.0,
                          ),
                        ),
                        onChanged: (val) {
                          name = val;
                        },
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        validator: (val) {
                          return val!.isEmpty ? "Enter Email" : null;
                        },
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
                        onTap: () => {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(30.0)),
                          height: 50.0,
                          alignment: Alignment.center,
                          child: Text(
                            "Sign Up",
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
                            "Already have an account? ",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignIn()));
                            },
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.blue,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 80.0,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
