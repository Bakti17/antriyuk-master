import 'package:antriyuk/Aktivitas.dart';
import 'package:antriyuk/AmbilAntri.dart';
import 'package:antriyuk/Akun.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HalHome extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.topCenter,
      fit: StackFit.expand,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.20,
              decoration: BoxDecoration(
                color: Color(0xffDC1B1B),
                borderRadius: BorderRadius.vertical(
                  bottom:
                      Radius.elliptical(MediaQuery.of(context).size.width, 100),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.115,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.065,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: <Widget>[
                    Spacer(
                      flex: 10,
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(user.photoURL!),
                    ),
                    Spacer(
                      flex: 3,
                    ),
                    Text(
                      user.displayName!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,                      
                      ),
                    ),
                    Spacer(
                      flex: 200,
                    )
                  ],
                ),
              ),
            ),
            Container(              
              padding: EdgeInsets.only(top: 15, left: 10, right: 10),
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(                
                borderRadius: BorderRadius.circular(20)
              ),
              child: WidgetNews(),
            ),            
            Container(
              padding: EdgeInsets.only(left: 10, top: 10),
              alignment: Alignment.centerLeft,
              height: 30,
              child: Text("Pilih Tempat Layanan yang dituju", style: TextStyle(
                fontSize: 16,
                fontFamily: "Roboto Bold"
              ),),
            ),
            Container(
              padding: EdgeInsets.only(top: 15, left: 10, right: 10),
              height: MediaQuery.of(context).size.height * 0.597,
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
              child: DinasWidget(),
            ),
            BarNavigasi(),
            Spacer(flex: 8),
          ],
        )
      ],
    ));
  }
}


////////////////////////////////////////// widget News //////////////////////////////////////////
class WidgetNews extends StatefulWidget {
  const WidgetNews({ Key? key }) : super(key: key);

  @override
  _WidgetNewsState createState() => _WidgetNewsState();
}

class _WidgetNewsState extends State<WidgetNews> {
  List<NewsList> listnews= [
    NewsList(news: 'Sekarang antri menjadi lebih mudah dengan AntriYuk', image: 'assets/queue.png'),
    NewsList(news: 'Sekarang antri menjadi lebih mudah dengan AntriYuk', image: 'assets/queue.png'),
    NewsList(news: 'Sekarang antri menjadi lebih mudah dengan AntriYuk', image: 'assets/queue.png'),
    NewsList(news: 'Sekarang antri menjadi lebih mudah dengan AntriYuk', image: 'assets/queue.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      
      scrollDirection: Axis.horizontal,
      itemCount: listnews.length,
      itemBuilder: (context, index){
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff9D9D9D),
              borderRadius: BorderRadius.circular(10)
            ),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.width * 0.12,
                  child: Image(
                    image: AssetImage(listnews[index].image),
                    fit: BoxFit.fill,),
                ),
                Text(listnews[index].news, textAlign: TextAlign.center,),
              ],
            )
          ),        
        );
      }
      
      );
  }
}


////////////////////////////////////////// News List Class //////////////////////////////////////////
class NewsList{
  String news ;
  String image ;

  NewsList({required this.news, required this.image});
}


////////////////////////////////////////// Dinas List Class //////////////////////////////////////////
class DinasList{
  String nama;
  String logo;

  DinasList({required this.nama, required this.logo});
}


////////////////////////////////////////// Widget List Dinas //////////////////////////////////////////
class DinasWidget extends StatefulWidget {
  @override 
  _DinasWidgetState createState() => _DinasWidgetState();
}

class _DinasWidgetState extends State<DinasWidget> {
  String dinas = "";
  AmbilAntri ambil = new AmbilAntri();

  List<DinasList> listDinas = [
    DinasList(nama: 'Dinas Kesehatan', logo: 'assets/logo/Logo_kesehatan.png'),
    DinasList(nama: 'DUKCAPIL', logo: 'assets/logo/Logo_Dukcapil.png'),
    DinasList(nama: 'Dinas Pendidikan', logo: 'assets/logo/Logo_dinasPendidikan.png'),
    DinasList(nama: 'DISHUB', logo: 'assets/logo/Logo_dishub.png'),
    DinasList(nama: 'Sosial, Tenaga Kerja, dan Transmigrasi', logo: 'assets/logo/Logo_KemNaKer.png'),
    DinasList(nama: 'Dinas Pekerjaan Umum', logo: 'assets/logo/Logo_PekerjaanUmum.png'),
    DinasList(nama: 'Dinas Pertanian', logo: 'assets/logo/Logo_DinasPertanian.png'),
    DinasList(nama: 'Dinas Pariwisata', logo: 'assets/logo/Logo_Klaten.png'),
    DinasList(nama: 'Dinas UMKM', logo: 'assets/logo/Logo_Klaten.png'),
    DinasList(nama: 'BPKD', logo: 'assets/logo/Logo_Klaten.png'),
    DinasList(nama: 'BAPPEDA', logo: 'assets/logo/Logo_Klaten.png'),
    DinasList(nama: 'Dinas Kepegawaian', logo: 'assets/logo/Logo_Klaten.png'),
    DinasList(nama: 'Dinas Kesbanglinmas', logo: 'assets/logo/Logo_Klaten.png'),
    DinasList(nama: 'Dinas Lingkungan Hidup', logo: 'assets/logo/Logo_lingkunganHidup.png'),
    DinasList(nama: 'Dinas Pemberdayaan Masyarakat', logo: 'assets/logo/Logo_Klaten.png'),
    DinasList(nama: 'Dinas Ketahanan Pangan', logo: 'assets/logo/Logo_Klaten.png'),
    DinasList(nama: 'Dinas Arsip dan Perpustakaan', logo: 'assets/logo/Logo_Klaten.png'),
    DinasList(nama: 'DINSOSP3AKB', logo: 'assets/logo/Logo_dinsosp3akb.png'),
    DinasList(nama: 'Dinas Pelayanan Terpadu', logo: 'assets/logo/Logo_Klaten.png'),
    DinasList(nama: 'Inspektorat', logo: 'assets/logo/Logo_Inspektorat.png'),
    DinasList(nama: 'Satpol PP', logo: 'assets/logo/Logo_SatpolPP.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      scrollDirection: Axis.vertical,
      children: List.generate(listDinas.length, (index){
        return Padding(
          padding: const EdgeInsets.all(5),
          child: Container(      
            padding: EdgeInsets.only(top:10),    
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width *0.2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.8),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white.withOpacity(0.1),
                shadowColor: Colors.white.withOpacity(0.1),
                padding:EdgeInsets.all(0),
              ),
              onPressed: (){
                dinas = listDinas[index].nama;
                AmbilAntri.tempat.text = dinas;                
                Navigator.push(context, MaterialPageRoute(builder: (context)=> AmbilAntri()));
              },
              child: Column(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    child: Image(
                      image: AssetImage(listDinas[index].logo),
                      fit: BoxFit.scaleDown,),
                  ),                  
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    width:80,
                    child: Text(
                      listDinas[index].nama,
                      textAlign: TextAlign.center,
                      style: TextStyle(                        
                        fontSize: 8,
                        fontFamily: "Roboto",
                        color: Colors.black                      
                      ),
                      maxLines: 2,),
                  ),
                  
                ],
              ),
            ),
          ),
        );
      }
      ),
    );
  }
}

class BarNavigasi extends StatefulWidget {
  const BarNavigasi({ Key? key }) : super(key: key);

  @override
  _BarNavigasiState createState() => _BarNavigasiState();
}

class _BarNavigasiState extends State<BarNavigasi> {
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
                      FontAwesomeIcons.home,
                      size: 30,
                      color: Color(0xffcd1b1b),                    
                    ),),
                    Container(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                        "Home",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xffbc1b1b)
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
                      color: Color(0xff6E6E6E),                    
                    ),),
                    Container(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                        "Antrian",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff6E6E6E),
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
                  SizedBox(
                    width: 40,
                    height: 30,                                      
                    child: Icon(
                      FontAwesomeIcons.user,
                      size: 30,
                      color: Color(0xff6E6E6E),                    
                    ),),                
                    Container(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                        "Profile",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff6E6E6E),
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