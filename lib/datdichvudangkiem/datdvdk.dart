import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../models/thanhpho.dart';
import 'datdvdk1.dart';

class DatDV extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<DatDV> {
  var controllerName_dl = TextEditingController();
  var controllerPhone_dl = TextEditingController();
  var controllerBienso_dl = TextEditingController();
  var controllerAdress = TextEditingController();

  City? selectTp;
  List<City> listTp = [];

  getCity() async {
    //City
    const String url = 'https://api.dangkiem.online/api/City';
    http.Response response = await http.get(Uri.parse(url));
    List<dynamic> jsonResponse = jsonDecode(response.body)["city"];
    setState(() {
      listTp = List<City>.from(jsonResponse.map((it) => City.fromJson(it)));
    });
  }

  @override
  void initState() {
    super.initState();
    getCity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text(
          "CỔNG DỊCH VỤ ĐĂNG KIỂM",
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
              const SizedBox(
                height: 20,
              ),
              Image.asset('images/logo.png', width: 40, height: 40),
              const Text(
                'ĐẶT DỊCH VỤ ĐĂNG KIỂM',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.normal,
                ),
              ),
              const Text(
                'NHÂN VÀ GIAO XE TẠI NHÀ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                ),
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
                      controller: controllerName_dl,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
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
                      controller: controllerPhone_dl,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
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
                      controller: controllerBienso_dl,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Biển số xe',
                        hintText: '30A-111.22',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 350,
                padding: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20)),
                child: DropdownButton<City>(
                  hint: const Text("Tỉnh/Tp"),
                  underline: Container(color: Colors.transparent),
                  value: selectTp,
                  iconSize: 36,
                  isExpanded: true,
                  items: listTp.map((City item) {
                    return DropdownMenuItem<City>(
                      child: Text(" " + item.name),
                      value: item,
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectTp = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 350,
                height: 80,
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: controllerAdress,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Địa chỉ nhận xe',
                        hintText: 'Nhập địa chỉ nhận xe',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 120,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  child: const Text('TIẾP TỤC',
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                  onPressed: () {
                    if (controllerName_dl.text.isEmpty ||
                        controllerPhone_dl.text.isEmpty ||
                        controllerBienso_dl.text.isEmpty ||
                        listTp.isEmpty ||
                        controllerAdress.text.isEmpty) {
                      const snackBar =
                          SnackBar(content: Text("Không được để trống"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DatDVDK(
                              hoten: controllerName_dl.text,
                              sdt: controllerPhone_dl.text,
                              bsx: controllerBienso_dl.text,
                              city: selectTp!.cityId,
                              dc: controllerAdress.text),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
