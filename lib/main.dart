import 'package:citymart/src/blocs/application_bloc.dart';
import 'package:citymart/views/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApplicationBloc(),
      child: GetMaterialApp(
        title: 'City Mart',
        theme: ThemeData(
          primarySwatch: Colors.green,
          brightness: Brightness.dark,
        ),
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}