import 'dart:convert';

import 'package:antriyuk/Selesai.dart';
import 'package:antriyuk/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:antriyuk/Aktivitas.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'homepage.dart';
import 'package:http/http.dart' as http;

class Akun extends StatefulWidget {
  const Akun({ Key? key }) : super(key: key);

  @override
  _AkunState createState() => _AkunState();
}

class _AkunState extends State<Akun> { 
  User user = FirebaseAuth.instance.currentUser!;

  Future<void>_singOut() async{
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> LoginPage()), (route) => false);
  }
  @override
  void initState() { 
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffdc1b1b),
        title: Text("Profil Saya"),),
      body: Column(
        children: [
          Container(
            child: Container(
              width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7885,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.18,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 20),
                    // color: Colors.green,
                    child: SizedBox(
                      height: 80,
                      width: 80,
                      child: CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.1),
                        backgroundImage: NetworkImage(user.photoURL!),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    padding: EdgeInsets.only(left: 20,right: 20),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Color(0xffDEDEDE)
                        ),
                        bottom: BorderSide(
                          color: Color(0xffDEDEDE)
                        ))
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Nama",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff626A7D)
                          ),
                        ),
                        Spacer(),
                        Text(
                          user.displayName!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    padding: EdgeInsets.only(left: 20,right: 20),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xffDEDEDE)
                        ))
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff626A7D)
                          ),
                        ),
                        Spacer(),
                        Text(
                          user.email!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(flex:10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(            
                      borderRadius: BorderRadius.circular(5),
                      boxShadow:[ 
                        BoxShadow(
                          color: Colors.black38,
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: Offset(1,5)
                        )
                      ],
                    ),
                    child: ElevatedButton(
                      child: Text(
                        "KELUAR",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Roboto Bold'
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffdc1b1b)
                      ),
                      onPressed: ()=>_singOut(),
                    ),
                  ),
                  Spacer(flex: 1,),
                  Text(
                    "Version 1.1",
                    style: TextStyle(
                      color: Color(0xffbababa),
                      fontSize: 12,
                      fontFamily: 'Roboto Bold'
                    ),
                  ),
                  Spacer(flex: 1,),
                ],
              ),
            ),
          ),
           Barnavigasi3()
        ],
      ),
    );
  }
}


class Barnavigasi3 extends StatefulWidget {
  const Barnavigasi3({ Key? key }) : super(key: key);

  @override
  _Barnavigasi3State createState() => _Barnavigasi3State();
}

class _Barnavigasi3State extends State<Barnavigasi3> {
  @override
  Widget build(BuildContext context) {
    return Container(      
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.091,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height *0.091,
            child: ElevatedButton(
              onPressed: (){
                Navigator.pushReplacement(
                  context, 
                  PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => HalHome(),
                      transitionDuration: Duration.zero,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white.withOpacity(0.1),
                shadowColor: Colors.white.withOpacity(0.1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    height: 30,
                    child: Icon(
                      FontAwesomeIcons.home,
                      size: 30,
                      color: Color(0xff6E6E6E),
                    ),),
                    Container(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                        "Home",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff6E6E6E)
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),        
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height *0.091,
            // color: Colors.green,            
            child: ElevatedButton(
              onPressed: (){
                Navigator.pushReplacement(
                  context, 
                  PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => AktivitasSaya(),
                      transitionDuration: Duration.zero,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white.withOpacity(0.1),
                shadowColor: Colors.white.withOpacity(0.1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    height: 30,                  
                    child: Icon(
                      Icons.list_alt,
                      size: 36,
                      color: Color(0xff6E6E6E)
                    ),),
                    Container(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                        "Antrian",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff6E6E6E)
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),          
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height *0.091,
            // color: Colors.green,            
            child: ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                primary: Colors.white.withOpacity(0.1),
                shadowColor: Colors.white.withOpacity(0.1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40,
                    height: 30,                                      
                    child: Icon(
                      FontAwesomeIcons.user,
                      size: 30,
                      color: Color(0xffcd1b1b),                    
                    ),),                
                    Container(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                        "Profile",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xffcd1b1b),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}