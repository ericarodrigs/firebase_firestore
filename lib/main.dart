import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_firestore_first/_core/my_colors.dart';
import 'package:flutter_firebase_firestore_first/firestore/presentation/home_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  firestore.collection('Um teste').doc('Um documento').set({'Prestou?': true});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listin - Lista Colaborativa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MyColors.brown,
        scaffoldBackgroundColor: MyColors.green,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: MyColors.red,
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: MyColors.blue,
        ),
        appBarTheme: const AppBarTheme(
          toolbarHeight: 72,
          centerTitle: true,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(32),
            ),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
