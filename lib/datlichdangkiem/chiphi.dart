import 'dart:convert';

import 'package:app1/datlichdangkiem/thanhtoan.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/price.dart';


class Chiphi extends StatefulWidget {
  int vehiclepdbId;
  int vehiclepkdId;
  int namsx;
  String? bsx;
  Object? user;
  Object? uses;
  String? hoten;
  String? sdt;
  int tp;
  int tramdk;
  String? hangxe;
  int loaipttdk;
  int ptdkltdb;
  String? ngay;
  int slot;
  String? tg;
  Chiphi({
    Key? key,
    required this.namsx,
    required this.bsx,
    required this.vehiclepdbId,
    required this.vehiclepkdId,
    required this.user,
    required this.hoten,
    required this.sdt,
    required this.tp,
    required this.tramdk,
    required this.hangxe,
    required this.loaipttdk,
    required this.ptdkltdb,
    required this.ngay,
    required this.slot,
    required this.tg,
    required this.uses,
  }) : super(key: key);
  @override
  _State createState() => _State();
}

class _State extends State<Chiphi> {
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  var controllergif = TextEditingController();
  bool isChecked = false;

  late Future<Price> futurePrice;

  Future<Price> postPrice() async {
    const uri = 'https://api.dangkiem.online/api/User/tempcosts';
    var pdbId = widget.vehiclepdbId;
    var pkdId = widget.vehiclepkdId;
    var nam = widget.namsx;
    var users = widget.user;
    var bsx = widget.bsx;
    var gif = controllergif.text;

    var requestBody = {
      'vehiclePdbId': pdbId,
      'vehiclePkdId': pkdId,
      'year': nam,
      'users': users,
      'service': isChecked,
      'code': gif,
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
      throw Exception('Lỗi không có dữ liệu trả về');
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
            children: [
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
              FutureBuilder<Price>(
                future: futurePrice,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
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
                                width: 100,
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
                        Row(
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
                              width: 100,
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
                            ),
                          ],
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
                                width: 100,
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
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                                futurePrice = postPrice();
                              },
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                "Lựa chọn dịch vụ đăng kiểm",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Visibility(
                              visible: isChecked,
                              child: Container(
                                margin: const EdgeInsets.all(15),
                                width: 100,
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
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        DottedBorder(
                          color: Colors.black45,
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
                                    controller: controllergif,
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
                                            controllergif.text.isEmpty;
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
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: Row(
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
                        ),
                        const SizedBox(height: 15),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                },
              ),
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
                              builder: (context) => Thanhtoan(
                                  hoten: widget.hoten,
                                  sdt: widget.sdt,
                                  bsx: widget.bsx,
                                  namsx: widget.namsx,
                                  tp: widget.tp,
                                  tramdk: widget.tramdk,
                                  hangxe: widget.hangxe,
                                  pttdk: widget.loaipttdk,
                                  ltdb: widget.ptdkltdb,
                                  day: widget.ngay,
                                  slot: widget.slot,
                                  time: widget.tg,
                                  user: widget.user,
                                  useService: isChecked,
                                  uses: widget.uses,
                                  voucherCode: controllergif.text),
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

