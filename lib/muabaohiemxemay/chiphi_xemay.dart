import 'package:app1/muabaohiemxemay/thanhtoan_xemay.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class CPxemay extends StatefulWidget {
  @override
  _State createState() => _State();
}
class _State extends State<CPxemay> {
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Image.asset('images/logo.png', width: 40,height: 40),
              const Text('CHI PHÍ TẠM TÍNH',
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: Text('Lệ phí chứng nhận đăng kiểm',
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
                    ),
                  ],
                ),
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
                        "Phí bảo trì đường bộ",
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Phí dịch vụ đi đăng kiểm",
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
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: const Border.fromBorderSide(
                            BorderSide (
                              width: 2,
                              color: Colors.green,
                              style: BorderStyle.solid,
                            )
                        ),
                      ),
                      width: 150,
                      height: 60,
                      child: const TextField(
                        decoration: InputDecoration(
                            icon: Icon(Icons.paste)
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
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
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
                              builder: (context)=>  TTxemay(
                              ),
                            ),
                          );
                        },
                        child: const Text('TIẾP TỤC'),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}