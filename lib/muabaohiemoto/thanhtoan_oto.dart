import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'end_oto.dart';

class Thanhtoanoto extends StatefulWidget {

  @override
  _ThanhtoanotoState createState() => _ThanhtoanotoState();
}

class _ThanhtoanotoState extends State<Thanhtoanoto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text("CỔNG DỊCH VỤ ĐĂNG KIỂM",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: <Widget>[
              Image.asset('images/logo.png', width: 40,height: 40),
              const Text("MUA BẢO HIỂM TNDS XE Ô TÔ",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.normal
                ),
              ),
              Image.asset('images/pay.png', width: 400,height: 400),
              Container(
                margin: const EdgeInsets.only(top: 100),
                width: 120,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                    child: const Text('Tiếp tục', style: TextStyle(fontSize: 15, color: Colors.white)),
                    onPressed:() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=>  HoanThanh_oto(
                          ),
                        ),
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
