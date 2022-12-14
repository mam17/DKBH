
import 'package:flutter/material.dart';

import 'end.dart';

class VCX extends StatefulWidget {


  @override
  _VCXState createState() => _VCXState();
}

class _VCXState extends State<VCX> {
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/logo.png', width: 40,height: 40),
              const Text("MUA BẢO HIỂM VCX Ô TÔ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.normal,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 350,
                height: 80,
                child: Column(
                  children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        labelText: 'Họ và tên',
                        hintText: 'Nhập họ và tên',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 350,
                height: 80,
                child: Column(
                  children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        labelText: 'Số điện thoại',
                        hintText: 'Nhập số điện thoại',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 350,
                height: 80,
                child: Column(
                  children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Email',
                        hintText: 'Nhập email',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 350,
                height: 80,
                child: Column(
                  children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        labelText: 'Mục đích sử dụng',
                        hintText: 'Nhập Mục đích sử dụng',
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    child: Text("Tải lên hình ảnh đăng ký xe"),
                  ),
                  Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                        child: Text('UPLOAD', style: TextStyle(fontSize: 15, color: Colors.red)),
                        onPressed: (){}
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 350,
                height: 80,
                child: Column(
                  children: <Widget>[
                    TextField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        labelText: 'Lựa chọn hãng bảo hiểm',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
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
                          builder: (context)=> VCX_end(
                          ),
                        ),
                      );
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
