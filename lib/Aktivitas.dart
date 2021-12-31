import 'dart:convert';

import 'package:antriyuk/Selesai.dart';
import 'package:antriyuk/detailAntrian.dart';
import './homepage.dart';
import './Akun.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AktivitasSaya extends StatefulWidget {

  @override
  _AktivitasSayaState createState() => _AktivitasSayaState();
}

class _AktivitasSayaState extends State<AktivitasSaya> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffDC1B1B),
        title: const Text("Aktivitas Saya"),
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
                  height : MediaQuery.of(context).size.width *0.092,
                  color: Color(0xffdc1b1b),
                  child: TextButton(
                    child: const Text(
                      "Antrian",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontFamily: 'Roboto'
                      ),
                    ),
                    onPressed: (){},
                  ),
                ),
                Container(
                  width : MediaQuery.of(context).size.width *0.5,
                  height : MediaQuery.of(context).size.width *0.1,
                  color: Color(0xffdc1b1b),
                  child: TextButton(
                    child: const Text(
                      "Selesai",
                      style: TextStyle(
                        color: Colors.white,

                      ),
                    ),
                    onPressed: (){
                      Navigator.pushReplacement(
                      context, 
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) => AktivitasSelesai(),
                        transitionDuration: Duration.zero,
                        ),
                      );
                    },
                  ),
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
            child: Antrian()
          ),
          BarNavigasi2()
        ],
      ),
    );
  }
}

class Antrian extends StatefulWidget {

  @override
  _AntrianState createState() => _AntrianState();
}

class _AntrianState extends State<Antrian> {
  User user = FirebaseAuth.instance.currentUser!;
  List listAntrian = [];

  Future getAntrian() async{
    final response = await http.post(Uri.parse("http://10.0.2.2/antriyuk/getAntrian.php"),body: {"email":user.email,"status":"Dipesan"});
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
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.35,
            padding: const EdgeInsets.only(top:20),
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
                  child: const Icon(Icons.access_time,color: Colors.red,),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Antrian telah dipesan",
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
                      style:const TextStyle(
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width:  MediaQuery.of(context).size.width * 0.5,),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white.withOpacity(0.2),
                              shadowColor: Colors.white.withOpacity(0.2)
                            ),
                            onPressed: (){
                              DetailAntrian.nomorAntrian.text = listAntrian[index]['nomorantri'];
                              DetailAntrian.nama.text = listAntrian[index]['nama'];
                              DetailAntrian.tempat.text = listAntrian[index]['namadinas'];
                              DetailAntrian.layanan.text = listAntrian[index]['layanan'];
                              DetailAntrian.tanggal = new DateFormat("y-MM-d").parse(listAntrian[index]['tanggal']!);
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailAntrian()));
                            },
                            child: Row(
                              children: const [
                                Text(
                                  "Lihat Detail",
                                  style: TextStyle(
                                    color: Color(0xffdc1b1b),
                                    fontWeight: FontWeight.bold,                        
                                  ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color: Color(0xffdc1b1b),
                                    size: 20,
                                    )
                              ],
                            ),
                          ),
                          )
                      ],
                    )
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


class BarNavigasi2 extends StatefulWidget {
  const BarNavigasi2({ Key? key }) : super(key: key);

  @override
  _BarNavigasi2State createState() => _BarNavigasi2State();
}

class _BarNavigasi2State extends State<BarNavigasi2> {
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
                  const SizedBox(
                    width: 40,
                    height: 30,
                    child: Icon(
                      FontAwesomeIcons.home,
                      size: 30,
                      color: Color(0xff6E6E6E),
                    ),),
                  Container(
                    padding: EdgeInsets.only(top: 2),
                    child: const Text(
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
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                primary: Colors.white.withOpacity(0.1),
                shadowColor: Colors.white.withOpacity(0.1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 40,
                    height: 30,                  
                    child: Icon(
                      Icons.list_alt,
                      size: 36,
                      color: Color(0xffcd1b1b),
                    ),),
                  Container(
                    padding: EdgeInsets.only(top: 2),
                    child: const Text(
                      "Antrian",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xffcd1b1b),
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
                      pageBuilder: (context, animation1, animation2) => Akun(),
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
                  const SizedBox(
                    width: 40,
                    height: 30,                                      
                    child: Icon(
                      FontAwesomeIcons.user,
                      size: 30,
                      color: Color(0xff6E6E6E),                    
                    ),),                
                  Container(
                    padding: EdgeInsets.only(top: 2),
                    child: const Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff6E6E6E)
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