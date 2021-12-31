// ignore_for_file: unused_element

import 'dart:async';
import 'package:antriyuk/Aktivitas.dart';
import 'package:antriyuk/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:antriyuk/welcomepage.dart';
import 'package:antriyuk/loginpage.dart';
import 'package:antriyuk/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './Selesai.dart';
import 'Akun.dart';

                                                          
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Pertama() ,
    );
  }
}

class Pertama extends StatefulWidget
{
  @override
  PertamaState createState() => PertamaState();
}

class PertamaState extends State<Pertama>
{
  bool pertama = true;

  void cekPertama() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? firstTime = prefs.getBool('first_time');

    if (firstTime != null && !firstTime) {
      setState(() {
        pertama = true;  
      });
    } else {
      setState(() {
        pertama = false;  
      });
    }
  }

  @override
  void initState() {
    super.initState();
    cekPertama();
  }

  @override
  Widget build(BuildContext context) {
    return pertama == true? WelcomePage() : CekLogin();
  }
}

class CekLogin extends StatefulWidget
{
  @override
  CekLoginState createState() => CekLoginState();
}

class CekLoginState extends State<CekLogin>
{
  User? _auth = FirebaseAuth.instance.currentUser;
  bool isLoggedin = false;

  void cekLogin(){
    var dura = new Duration(seconds: 3);
    if (_auth != null){
      setState(() {
        isLoggedin = true;
      });
    }
    else{
      setState(() {
        isLoggedin = false;
      });
    }
  }
  
  @override
  void initState() {
    super.initState();
    cekLogin();
  }

  @override
  Widget build(BuildContext context) {
    
    return isLoggedin == true? HalHome(): LoginPage();
  }

}