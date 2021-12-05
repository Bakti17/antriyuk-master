import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:antriyuk/homepage.dart';
import 'package:antriyuk/reviewantri.dart';
import 'package:antriyuk/HasilAntri.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;


class AmbilAntri extends StatefulWidget {
  static TextEditingController tempat = TextEditingController();
  static List list = [];
  
  @override
  _AmbilAntriState createState() => _AmbilAntriState();
}

class _AmbilAntriState extends State<AmbilAntri> {
  late Future<List<Layanan>> lLayanan;
  final user = FirebaseAuth.instance.currentUser!;
  TextEditingController namaLengkap = TextEditingController();
  TextEditingController tempat = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  
  String valLayanan = "";
  List<String> listLayanan = [];
  
  void LLayanan(String dinas) async{
    final response = await  http.post(Uri.parse("http://10.0.2.2/antriyuk/getLayanan.php"), body: {"dinas":dinas});
    List item = jsonDecode(response.body);
    for(int i =0; i<item.length; i++){
      String n = item[i]['layanan'];
      setState(() {
         listLayanan.add(n);
      });
    }
    if(listLayanan.length>0){
      valLayanan = listLayanan[0];
    }
    else{
      _showMyDialog();
    }
  }

  void _lanjut(){
    ReviewAntri.nm.text = namaLengkap.text;
    ReviewAntri.lyn.text = valLayanan;
    ReviewAntri.tgl.text = dateinput.text;
    ReviewAntri.tmpt.text = tempat.text;
    HasilAntri.nm.text = namaLengkap.text;
    HasilAntri.lyn.text = valLayanan;
    HasilAntri.tmpt.text = tempat.text;
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewAntri()));
  }

  Future<void> _showMyDialog() async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Belum ada data'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Maaf. Belum ada layanan yang ada'),
              Text('pada tempat yang anda pilih'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context)
              .pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>HalHome()), (Route<dynamic> route) => false);
            },
          ),
        ],
      );
    },
  );
}
  @override
  void initState(){ 
    super.initState();
    initializeDateFormatting('id_ID', null);

    namaLengkap.text = user.displayName!;
    String ndinas= AmbilAntri.tempat.text;  
    tempat.text = ndinas;
    dateinput.text = ReviewAntri.tgl.text;
    LLayanan(ndinas);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffDC1B1B),
        leading: IconButton(
          onPressed:()=> Navigator.pop(context),
          icon: Icon(Icons.arrow_back)),
        title: Text("Ambil Antrian"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(flex: 2,),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            padding: EdgeInsets.only(left: 30),
            child: Text("Detail antrian", style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),),
          ),


          Spacer(flex: 2,),  ////////////////Nama Lengkap
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            padding: EdgeInsets.only(left: 30),
            child: Text("Nama lengkap", style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),),
          ),
          Container(
            padding: EdgeInsets.only(left: 30),
            width: MediaQuery.of(context).size.width * 0.9,
            alignment: Alignment.center,
            child: TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                hintText: "Nama lengkap anda",
                hintStyle: TextStyle(color: Colors.black87),
                border: UnderlineInputBorder(),
              ),
              controller: namaLengkap,
            )
          ),

          Spacer(flex: 1,), //Tempat
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            padding: EdgeInsets.only(left: 30),
            child: Text("Tempat", style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),),
          ),
          Container(
            padding: EdgeInsets.only(left: 30),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.05,
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width * 0.899,
              height: MediaQuery.of(context).size.height * 0.045,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey)
              ),              
              child: TextField(
                controller:tempat,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                enabled: false,
              ),
            )
          ),

          Spacer(flex: 1,), //Layanan
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            padding: EdgeInsets.only(left: 30),
            child: Text("Layanan", style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),),
          ),
          Container(
            padding: EdgeInsets.only(left: 30),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.05,
            child: DropdownButton(
              isExpanded: true,
              hint: Text("Pilih Layanan"),
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Color(0xffdc1b1b)
              ),
              value: valLayanan,
              items: listLayanan.map((value) {
                return DropdownMenuItem(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
              onChanged: (value) {
                setState(()=> {
                  this.valLayanan = value.toString()
                });
              },
            ),
          ),


          Spacer(flex: 1,), //Tanggal
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            padding: EdgeInsets.only(left: 30),
            child: Text("Tanggal", style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),),
          ),
          Container(
            padding: EdgeInsets.only(left: 30),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.05,
            child: TextField(
                controller: dateinput, 
                decoration: InputDecoration( 
                   suffixIcon: Icon(Icons.calendar_today,color: Color(0xffdc1b1b)), 
                   hintText: "Masukkan tanggal",
                ),
                readOnly: true,  
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context, initialDate: DateTime.now(),
                      firstDate: DateTime(2000), 
                      lastDate: DateTime(2101)
                  );                  
                  if(pickedDate != null ){
                      String formattedDate = DateFormat("EEEE, d MMMM y", "id_ID").format(pickedDate); 
                      setState(() {
                         dateinput.text = formattedDate;                      
                      });
                      HasilAntri.tgl = pickedDate;
                  }
                },
             )
          ),

          Spacer(flex: 20,),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: -10,
                  blurRadius: 5,
                  offset: Offset(0, 7), // changes position of shadow
                ),
              ],
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.05,
              child: ElevatedButton(                
                onPressed: (){
                  _lanjut();
                },
                child: Text("LANJUTKAN", style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.square(20 * 30),
                  primary: Color(0xffdc1b1b)
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}

class Layanan {
  final String dinas;
  final String layanan;

  Layanan({required this.dinas, required this.layanan});

  factory Layanan.fromJson(Map<String, dynamic> json) {
    return Layanan(
      dinas: json['dinas'],
      layanan: json['age'],
    );
  }

  Map<String, dynamic> toJson() => {
    'dinas': dinas,
    'layanan': layanan,
  };
}