import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qr_flutter/qr_flutter.dart';

import '../models/maqr.dart';

class QRPage extends StatefulWidget {
  int namsx;
  String? bsx;
  String? hoten;
  String? sdt;
  int tp;
  int tramdk;
  String? hangxe;
  int pttdk;
  int ltdb;
  String? day;
  int slot;
  String? time;
  Object? user;
  Object? uses;
  bool useService;
  String? voucherCode;
  QRPage({
    Key? key,
    required this.namsx,
    required this.bsx,
    required this.hoten,
    required this.sdt,
    required this.tp,
    required this.tramdk,
    required this.hangxe,
    required this.pttdk,
    required this.ltdb,
    required this.day,
    required this.slot,
    required this.time,
    required this.user,
    required this.uses,
    required this.useService,
    required this.voucherCode,
  }) : super(key: key);

  @override
  State<QRPage> createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isChecked = false;

  late Future<Qrcode> futureQr;

  Future<Qrcode> postQr() async {
    const uri = 'https://api.dangkiem.online/api/User/schedule';
    var name = widget.hoten;
    var phone = widget.sdt;
    var bsx = widget.bsx;
    var city = widget.tp;
    var stationId = widget.tramdk;
    var vehiclePKDId = widget.pttdk;
    var vehiclePDBId = widget.ltdb;
    var hang = widget.hangxe;
    var nam = widget.namsx;
    var isOwner = widget.user;
    var users = widget.uses;
    var useService = widget.useService;
    var voucher = widget.voucherCode;
    var date = widget.day;
    var timeslot = widget.time;

    var requestBody = {
      "name": name,
      "phoneNumber":phone ,
      "licensePlates":bsx ,
      "cityId":city ,
      "stationId": stationId,
      "vehiclePKDId": vehiclePKDId,
      "vehiclePDBId":vehiclePDBId ,
      "carCompany": hang,
      "yearofManufacture": nam,
      "isOwner": isOwner,
      "uses": users,
      "useService":useService ,
      "voucherCode": voucher,
      "schedule": date,
      "timeSlot":timeslot
    };

    Map<String, String> headers = {"Content-type": "application/json"};
    http.Response response = await http.post(
      Uri.parse(uri),
      headers: headers,
      body: json.encode(requestBody),
    );
    if (response.statusCode == 200) {
      return Qrcode.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    futureQr = postQr();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "MÃ QR-CODE ĐẶT LỊCH ĐĂNG KIỂM CỦA BẠN",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder<Qrcode>(
              future: futureQr,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return QrImage(
                    data: snapshot.data!.objectId,
                    version: QrVersions.auto,
                    size: 230.0,
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
            const Text("(Vui lòng xuất trình cho nhân viên tiếp đón)"),
            const SizedBox(
              height: 15,
              width: 25,
            ),
            DottedBorder(
              color: Colors.black,
              strokeWidth: 1,
              child: Column(children: <Widget>[
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "GIẤY TỜ HỒ SƠ BẠN CẦN CHUẨN BỊ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "1.Đăng ký xe(Đối với xe thế chấp hoặc vay ngân hàng cần giấy biên chấp và đăng ký xe công chứng còn thời hạn)",
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          "2.Đăng kiểm xe cũ",
                          style: TextStyle(fontSize: 15),
                        )
                      ],
                    )),
              ]),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 120,
                    height: 45,
                    color: Colors.orangeAccent,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.lime, disabledForegroundColor: Colors.grey.withOpacity(0.38),
                      ),
                      onPressed: () {
                        Future.delayed(const Duration(seconds: 5),
                                () => Navigator.of(context).popUntil((route) => route.isFirst)
                        );
                      },
                      child: const Text('HOÀN TẤT'),
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
                      },
                      child: const Text('QUAY LẠI'),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}