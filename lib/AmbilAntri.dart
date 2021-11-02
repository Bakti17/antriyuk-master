import 'package:flutter/material.dart';
import 'package:antriyuk/homepage.dart';
import 'package:antriyuk/reviewantri.dart';
import 'package:intl/intl.dart';

class AmbilAntri extends StatefulWidget {
  const AmbilAntri({ Key? key }) : super(key: key);

  @override
  _AmbilAntriState createState() => _AmbilAntriState();
}

class _AmbilAntriState extends State<AmbilAntri> {
  String _valLayanan = "Administrasi";
  List _listLayanan = [
    "Administrasi",
    "Check Up"
  ];
  TextEditingController dateinput = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffDC1B1B),
        leading: IconButton(
          onPressed:()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>HalHome())),
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
          Spacer(flex: 2,),
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
              child: Text("Dinas",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),),
            )
          ),

          Spacer(flex: 1,), //Tempat
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
              value: _valLayanan,
              items: _listLayanan.map((value) {
                return DropdownMenuItem(
                  child: Text(value),
                  value: value,
                );
              }).toList(),
              onChanged: (value) {
                setState(()=> {
                  this._valLayanan = value.toString()
                });
              },
            ),
          ),


          Spacer(flex: 1,), //Tempat
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
                      print(pickedDate);  
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); 
                      print(formattedDate); 
                      setState(() {
                         dateinput.text = formattedDate;
                      });
                  }else{
                      print("Tanggal belum dipilih");
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
                onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewAntri())),
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
