import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home.dart';
import 'package:stonked/stockProvider.dart';
import 'package:stonked/home.dart'; 
// import 'package:firebase_core/firebase_core.dart'; 
// import 'package:stonks/services/firebaseauth_service.dart';

void main(){
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  return runApp(
      //This provider will notify the UI Widgets to update its content
      ChangeNotifierProvider(
        //Register the Central Data Store
        create: (context) => StockProvider(),
        child: MyApp(),
      ),
      );
}

class MyApp extends StatefulWidget {
  static const routeName = '/MyApp';

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stonks',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
