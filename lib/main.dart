import 'package:flutter/material.dart';

import 'baohiemthanxe/VCX_oto.dart';
import 'datdichvudangkiem/datdvdk.dart';
import 'datlichdangkiem/datlich.dart';
import 'dongphiduongbo/dongphi.dart';
import 'muabaohiemoto/TNDS_oto.dart';
import 'muabaohiemxemay/TNDS_xemay.dart';

void main() => runApp(const Home());

class Home extends StatelessWidget{
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Mam',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const HomeState(),
    );
  }
}

class HomeState extends StatefulWidget{
  const HomeState({Key? key}) : super(key: key);
  @override
  State <StatefulWidget> createState(){
    return _MyappState();
  }
}

class _MyappState extends State<HomeState>{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Home",
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("images/IMG_2940.JPG"),
                    fit: BoxFit.cover),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('images/logo.png', width: 100,height: 100),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('CỔNG DỊCH VỤ',
                      style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontSize: 50,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                      child: const Text('ĐĂNG KIỂM VÀ BẢO HIỂM XE CƠ GIỚI',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                width: 160,
                                height: 100,
                                color: Colors.white,
                                child: Column(
                                  children: <Widget>[
                                    const Icon(
                                      Icons.date_range_outlined,
                                      size: 35,
                                    ),
                                    TextButton(
                                      onPressed: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>  Datlich()),
                                        );
                                      },
                                      child: const Text('ĐẶT LỊCH ĐĂNG KIỂM',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black,
                                        ),
                                      ),),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                width: 160,
                                height: 100,
                                color: Colors.white,
                                child: Column(
                                  children: <Widget>[
                                    const Icon(
                                      Icons.money,
                                      size: 35,
                                    ),
                                    TextButton(
                                      onPressed: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>  Dongphi()),
                                        );
                                      },
                                      child: const Text('ĐÓNG PHÍ ĐƯỜNG BỘ',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black,
                                        ),
                                      ),),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                width: 160,
                                height: 100,
                                color: Colors.white,
                                child: Column(
                                  children: <Widget>[
                                    const Icon(
                                      Icons.motorcycle,
                                      size: 35,
                                    ),
                                    TextButton(
                                      onPressed: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context)=> TNDS_xemmay()),
                                        );
                                      },
                                      child: const Text('MUA BẢO HIỂM TNDS XE MÁY',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black,
                                        ),
                                      ),),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                width: 160,
                                height: 100,
                                color: Colors.white,
                                child: Column(
                                  children: <Widget>[
                                    const Icon(
                                      Icons.offline_pin,
                                      size: 35,
                                    ),
                                    TextButton(
                                      onPressed: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context)=> DatDV()),
                                        );
                                      },
                                      child: const Text('ĐẶT DỊCH VỤ ĐĂNG KIỂM',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black,
                                        ),
                                      ),),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                width: 160,
                                height: 100,
                                color: Colors.white,
                                child: Column(
                                  children: <Widget>[
                                    const Icon(
                                      Icons.car_repair,
                                      size: 35,
                                    ),
                                    TextButton(
                                      onPressed: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context)=> TNDS_oto()),
                                        );
                                      },
                                      child: const Text('MUA BẢO HIỂM Ô TÔ',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black,
                                        ),
                                      ),),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Container(
                                width: 160,
                                height: 100,
                                color: Colors.white,
                                child: Column(
                                  children: <Widget>[
                                    const Icon(
                                      Icons.car_rental,
                                      size: 35,
                                    ),
                                    TextButton(
                                      onPressed: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context)=> VCX()),
                                        );
                                      },
                                      child: const Text('MUA BẢO HIỂM THÂN VỎ XE',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                          fontStyle: FontStyle.normal,
                                          color: Colors.black,
                                        ),
                                      ),),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
