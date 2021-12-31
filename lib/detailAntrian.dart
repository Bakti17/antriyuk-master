import 'dart:convert';
import 'package:antriyuk/Aktivitas.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

class DetailAntrian extends StatefulWidget {
  static TextEditingController nomorAntrian = TextEditingController();
  static TextEditingController nama = TextEditingController();
  static TextEditingController tempat = TextEditingController();
  static TextEditingController layanan = TextEditingController();
  static DateTime? tanggal;

  @override
  _DetailAntrianState createState() => _DetailAntrianState();
}

class _DetailAntrianState extends State<DetailAntrian> {
  User user = FirebaseAuth.instance.currentUser!;
  TextEditingController nomorAntrian = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController tempat = TextEditingController();
  TextEditingController layanan = TextEditingController();
  TextEditingController tanggal = TextEditingController();
  TextEditingController alamat = TextEditingController();


  Future getAlamat() async{
    final response = await http.post(Uri.parse("http://10.0.2.2/antriyuk/getAlamat.php"),body:{"dinas":tempat.text});
    List list = jsonDecode(response.body);
    setState(() {
      alamat.text = list[0]['alamat'];
    });
  }

  @override
  void initState() { 
    super.initState();
     initializeDateFormatting('id_ID', null);
    nomorAntrian.text = DetailAntrian.nomorAntrian.text;
    nama.text = DetailAntrian.nama.text;
    tempat.text = DetailAntrian.tempat.text;
    layanan.text = DetailAntrian.layanan.text;
    tanggal.text = DateFormat("EEEE, d MMMM y", "id_ID").format(DetailAntrian.tanggal!);
    getAlamat();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffdc1b1b),
        title: Text("Detail Antrian"),
        leading: IconButton(
          onPressed: ()=> Navigator.of(context)
              .pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>AktivitasSaya()), (Route<dynamic> route) => false),
          icon: Icon(Icons.arrow_back_ios),
          ),
        ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.9,
        padding: EdgeInsets.only(left: 20,top: 20),
        decoration: BoxDecoration(
          // color: Colors.red,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Detail Antrian",
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto'
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Nomor Antrian",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xffbababa),
                fontFamily: 'Roboto'
              ),
            ),
            Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.05,
            alignment: Alignment.center,
            child: TextField(
              controller: nomorAntrian,
              textAlign: TextAlign.left,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
              ),
              enabled: false,
            )
          ),
          const SizedBox(
              height: 20,
            ),
            const Text(
              "Nama Lengkap",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xffbababa),
                fontFamily: 'Roboto'
              ),
            ),
            Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.05,
            alignment: Alignment.center,
            child: TextField(
              controller: nama,
              textAlign: TextAlign.left,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
              ),
              enabled: false,
            )
          ),
          const SizedBox(
              height: 20,
            ),
            const Text(
              "Nama Tempat",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xffbababa),
                fontFamily: 'Roboto'
              ),
            ),
            Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.05,
            alignment: Alignment.center,
            child: TextField(
              controller: tempat,
              textAlign: TextAlign.left,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
              ),
              enabled: false,
            )
          ),
          const SizedBox(
              height: 20,
            ),
            const Text(
              "Layanan",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xffbababa),
                fontFamily: 'Roboto'
              ),
            ),
            Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.05,
            alignment: Alignment.center,
            child: TextField(
              controller: layanan,
              textAlign: TextAlign.left,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
              ),
              enabled: false,
            )
          ),
          const SizedBox(
              height: 20,
            ),
            const Text(
              "Alamat Tempat",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xffbababa),
                fontFamily: 'Roboto'
              ),
            ),
            Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.1,
            alignment: Alignment.center,
            child: TextField(
              minLines: 1,
              maxLines: 3 ,
              controller: alamat,
              textAlign: TextAlign.left,              
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
              ),
              enabled: false,
            )
          ),
          const SizedBox(
              height: 20,
            ),
            const Text(
              "Tanggal",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xffbababa),
                fontFamily: 'Roboto'
              ),
            ),
            Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.05,
            alignment: Alignment.center,
            child: TextField(
              controller: tanggal,
              textAlign: TextAlign.left,
              // controller:,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
              ),
              enabled: false,
            )
          ),
          
          ],
        ),
        
      ),
    );
  }
}