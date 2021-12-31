import 'dart:convert';

import 'package:antriyuk/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
 import 'package:antriyuk/Aktivitas.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class AktivitasSelesai extends StatefulWidget {
  const AktivitasSelesai({ Key? key }) : super(key: key);

  @override
  _AktivitasSelesaiState createState() => _AktivitasSelesaiState();
}

class _AktivitasSelesaiState extends State<AktivitasSelesai> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffDC1B1B),
        title: Text("Aktivitas Saya"),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.topCenter,
            width : MediaQuery.of(context).size.width,
            height : MediaQuery.of(context).size.width *0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width : MediaQuery.of(context).size.width *0.5,
                  height : MediaQuery.of(context).size.width *0.1,
                  color: Color(0xffdc1b1b),
                  child: TextButton(
                    child: Text(
                      "Antrian",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: (){
                      Navigator.pushReplacement(
                        context, 
                        PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) => AktivitasSaya(),
                            transitionDuration: Duration.zero,
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  width : MediaQuery.of(context).size.width *0.5,
                  height : MediaQuery.of(context).size.width *0.092,
                  color: Color(0xffdc1b1b),
                  child: TextButton(
                    child: Text(
                      "Selesai",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),
                    ),
                    onPressed: (){},),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.7285,
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
            // color: Colors.red,
            child: Selesai()
          ),
          BarNavigasi2()
        ],
      ),
    );
  }
}


class Selesai extends StatefulWidget {
  const Selesai({ Key? key }) : super(key: key);

  @override
  _SelesaiState createState() => _SelesaiState();
}

class _SelesaiState extends State<Selesai> {
  User user = FirebaseAuth.instance.currentUser!;
  List listAntrian = [];

  Future getAntrian() async{
    final response = await http.post(Uri.parse("http://10.0.2.2/antriyuk/getAntrian.php"),body: {"email":user.email,"status":"Selesai"});
    setState(() {
      listAntrian = jsonDecode(response.body);
    });
  }

  @override
  void initState() { 
    super.initState();
    getAntrian();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: listAntrian.length,
      itemBuilder: (context,index){
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.3,
            padding: EdgeInsets.only(top:20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
               boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: Offset(1, 10), // changes position of shadow
                  ),
                ],
            ),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.1,
                  // color: Colors.white,
                  alignment: Alignment.topCenter,
                  child: Icon(Icons.task_alt,color: Color(0xff2BC48A),),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Antrian telah selesai",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        fontFamily: 'Roboto Medium'
                      ),
                    ),
                    const SizedBox(height: 3),
                    const Text(
                      "Nomor Antrian",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                        fontFamily: 'Roboto'
                      ),
                    ),
                    Text(
                      listAntrian[index]['nomorantri'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Roboto'
                      ),
                    ),
                    const SizedBox(height: 3),
                    const Text(
                      "Nama Lengkap",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                        fontFamily: 'Roboto'
                      ),
                    ),
                    Text(
                      listAntrian[index]['nama'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Roboto'
                      ),
                    ),
                    const SizedBox(height: 3),
                    const Text(
                      "Nama Tempat",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                        fontFamily: 'Roboto'
                      ),
                    ),
                    Text(
                      listAntrian[index]['namadinas'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Roboto'
                      ),
                    ),
                    const SizedBox(height: 3),
                    const Text(
                      "Nama Layanan",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                        fontFamily: 'Roboto'
                      ),
                    ),
                    Text(
                      listAntrian[index]['layanan'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontFamily: 'Roboto'
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        const Icon(FontAwesomeIcons.calendarAlt,color: Color(0xff68686A),),
                        const SizedBox(width:5),
                        Text(
                          listAntrian[index]['tanggal'],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontFamily: 'Roboto'
                          ),
                        )
                      ],
                    ),
                   
                  ],
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
