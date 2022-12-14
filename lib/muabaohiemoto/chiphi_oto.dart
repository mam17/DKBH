import 'package:app1/muabaohiemoto/thanhtoan_oto.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'TNDS_oto.dart';

class CPoto extends StatefulWidget {

  @override
  _CPotoState createState() => _CPotoState();
}

class _CPotoState extends State<CPoto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text("CỔNG DỊCH VỤ ĐĂNG KIỂM",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.normal,
          ),),
      ),
      body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Image.asset('images/logo.png', width: 40,height: 40),
              const Text('CHI PHÍ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.normal,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DottedBorder(
                color: Colors.black,
                strokeWidth: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Phí kiểm định",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15),
                      width: 120,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(""),
                    )
                  ],
                ),
              ),
               DottedBorder(
                  color: Colors.black,
                  strokeWidth: 1,
                  child: SizedBox(
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "MÃ ƯU ĐÃI",
                            style: TextStyle(fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          height: 40,
                          child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)
                                ),
                              ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 120,
                            height: 45,
                            color: Colors.orangeAccent,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white, backgroundColor: Colors.blue, disabledForegroundColor: Colors.grey.withOpacity(0.38),
                              ),
                              onPressed: () {
                              },
                              child: const Text('ÁP DỤNG'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "TỔNG CHI PHÍ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    width: 200,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(""),
                  )
                ],
              ),
              const SizedBox(height: 300),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 120,
                      height: 45,
                      color: const Color.fromRGBO(111, 70, 2, 1.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Colors.brown, disabledForegroundColor: Colors.grey.withOpacity(0.38),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context)=>  TNDS_oto(
                              ),
                            ),
                          );
                        },
                        child: const Text('QUAY LẠI'),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 120,
                      height: 45,
                      color: Colors.orangeAccent,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Colors.amber, disabledForegroundColor: Colors.grey.withOpacity(0.38),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context)=>  Thanhtoanoto(
                              ),
                            ),
                          );
                        },
                        child: const Text('THANH TOÁN'),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
    );
  }
}
