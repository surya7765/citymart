import 'package:citymart/models/user_profile.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<UserProfileList> _userProfileList = <UserProfileList>[
    UserProfileList(
      list_item: 'Profile',
      list_icon: Icons.person,
    ),
    UserProfileList(
      list_item: 'Favorite',
      list_icon: Icons.favorite_rounded,
    ),
    UserProfileList(
      list_item: 'Address',
      list_icon: Icons.location_on,
    ),
    UserProfileList(
      list_item: 'Logout',
      list_icon: Icons.exit_to_app,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(_userProfileList[index].list_icon),
              title: Text(_userProfileList[index].list_item),
              onTap: () {
                if (_userProfileList[index].list_item == 'Logout') {
                  Navigator.pushNamed(context, '/login');
                }
              },
            );
          },
          itemCount: _userProfileList.length,
        ),
      ),
    );
  }
}
