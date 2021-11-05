import 'package:citymart/views/sellers.dart';
import 'package:flutter/material.dart';

class LoginUi extends StatefulWidget {
  const LoginUi({Key? key}) : super(key: key);

  @override
  _LoginUiState createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 45.0,
            child: Image(
              image: NetworkImage(
                  "https://3.bp.blogspot.com/-bK9GzQwyfik/V_736QoZ0rI/AAAAAAAAFxM/13EKzLwStRw1qhADMonjAY3f7dWxBq7OACLcB/s1600/User_man_male_profile_account_person_people.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                  hintText: 'Enter valid mobile number'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter your secure password'),
            ),
          ),
          FlatButton(
            onPressed: () {},
            child: Text(
              'Forgot Password',
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: FlatButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => SellerPage()));
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
