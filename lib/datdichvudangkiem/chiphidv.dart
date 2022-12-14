import 'package:app1/datdichvudangkiem/thanhtoandv.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/price.dart';

class Chiphi extends StatefulWidget {
  String? hoten;
  String? sdt;
  String? bsx;
  int city;
  String? dc;
  String? bra;
  int? year;
  Object? isOwner;
  Object? uses;
  String? time;
  int vehiclepdbId;
  int vehiclepkdId;
  String? date;
  Chiphi(
      {Key? key,
        required this.bsx,
        required this.hoten,
        required this.sdt,
        required this.city,
        required this.dc,
        required this.bra,
        required this.year,
        required this.isOwner,
        required this.uses,
        required this.time,
        required this.vehiclepdbId,
        required this.vehiclepkdId,
        required this.date})
      : super(key: key);
  @override
  _State createState() => _State();
}

class _State extends State<Chiphi> {
  var controllerGif = TextEditingController();
  late Future<Price> futurePrice;
  bool ischecked = true;

  Future<Price> postPrice() async {
    const uri = 'https://api.dangkiem.online/api/User/tempcosts';

    var pdbId = widget.vehiclepdbId;
    var pkdId = widget.vehiclepkdId;
    var nam = widget.year;
    var users = widget.uses;
    var bsx = widget.bsx;
    var vc = controllerGif.text;

    var requestBody = {
      'vehiclePdbId': pdbId,
      'vehiclePkdId': pkdId,
      'year': nam,
      'users': users,
      "service": true,
      'code': vc,
      'licensePlates': bsx
    };

    Map<String, String> headers = {"Content-type": "application/json"};
    http.Response response = await http.post(
      Uri.parse(uri),
      headers: headers,
      body: json.encode(requestBody),
    );
    if (response.statusCode == 200) {
      return Price.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    futurePrice = postPrice();
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
                'CHI PHÍ TẠM TÍNH',
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
              FutureBuilder<Price>(
                future: futurePrice,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: <Widget>[
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
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(snapshot.data!.costPkd,
                                      textAlign: TextAlign.center),
                                ),
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
                                child: Text(
                                  'Lệ phí chứng nhận đăng kiểm',
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
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(snapshot.data!.costPdb,
                                      textAlign: TextAlign.center),
                                ),
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
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(snapshot.data!.costCert,
                                      textAlign: TextAlign.center),
                                ),
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
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Text(
                                      snapshot.data!.costService.toString(),
                                      textAlign: TextAlign.center),
                                ),
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
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  height: 40,
                                  child: TextField(
                                    controller: controllerGif,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(15)),
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
                                        setState(() {
                                          if (snapshot.data!.voucherCode ==
                                              null) {
                                            controllerGif.text.isEmpty;
                                          } else {
                                            futurePrice = postPrice();
                                          }
                                        });
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
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(snapshot.data!.costTotalTemp,
                                    textAlign: TextAlign.center),
                              ),
                            )
                          ],
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                },
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
                              builder: (context) => ThanhtoanDV(
                                hoten: widget.hoten,
                                sdt: widget.sdt,
                                bsx: widget.bsx,
                                city: widget.city,
                                dc: widget.dc,
                                bra: widget.bra,
                                year: widget.year,
                                isOwner: widget.isOwner,
                                uses: widget.uses,
                                time: widget.time,
                                date: widget.date,
                                vehiclepdbId: widget.vehiclepdbId,
                                vehiclepkdId: widget.vehiclepkdId,
                                voucher: controllerGif.text
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
