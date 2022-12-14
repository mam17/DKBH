import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:qr_flutter/qr_flutter.dart';

import '../models/qrdv.dart';

class QRDV extends StatefulWidget {
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
  String? voucher;
  QRDV(
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
      required this.date,
      required this.voucher})
      : super(key: key);
  @override
  State<QRDV> createState() => _QRPageState();
}

class _QRPageState extends State<QRDV> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isChecked = false;

  late Future<Qrdv> futureQr;

  Future<Qrdv> postQr() async {
    const uri = 'https://api.dangkiem.online/api/User/home_service';
    var name = widget.hoten;
    var phone = widget.sdt;
    var bsx = widget.bsx;
    var city = widget.city;
    var carDeliveryAddress = widget.dc;
    var vehiclePKDId = widget.vehiclepkdId;
    var vehiclePDBId = widget.vehiclepdbId;
    var hang = widget.bra;
    var nam = widget.year;
    var isOwner = widget.isOwner;
    var users = widget.uses;
    var voucher = widget.voucher;
    var date = widget.date;
    var time = widget.time;

    var requestBody = {
      "name": name,
      "phoneNumber": phone,
      "licensePlates": bsx,
      "cityId": city,
      "carDeliveryAddress": carDeliveryAddress,
      "vehiclePKDId": vehiclePKDId,
      "vehiclePDBId": vehiclePDBId,
      "carCompany": hang,
      "yearofManufacture": nam,
      "isOwner": isOwner,
      "uses": users,
      "voucherCode": voucher,
      "date": date,
      "time": time
    };

    Map<String, String> headers = {"Content-type": "application/json"};
    http.Response response = await http.post(
      Uri.parse(uri),
      headers: headers,
      body: json.encode(requestBody),
    );
    if (response.statusCode == 200) {
      return Qrdv.fromJson(jsonDecode(response.body));
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
        title: const Text(
          "C???NG D???CH V??? ????NG KI???M",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "C???m ??n b???n ???? s??? d???ng d???ch v???, nh??n vi??n CSKH v?? l??i xe s??? li??n h??? v???i b???n trong v??ng 30 ph??t t???i ????? x??c nh???n th??ng tin. Vui l??ng ????? ?? ??i???n tho???i trong th??i gian tr??n.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 15,
              width: 25,
            ),
            FutureBuilder<Qrdv>(
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
            const Text("M?? QR c???a b???n"),
            DottedBorder(
              color: Colors.black,
              strokeWidth: 1,
              child: Column(children: <Widget>[
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "GI???Y T??? H??? S?? B???N C???N CHU???N B???",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "1.????ng k?? xe(?????i v???i xe th??? ch???p ho???c vay ng??n h??ng c???n gi???y bi??n ch???p v?? ????ng k?? xe c??ng ch???ng c??n th???i h???n)",
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          "2.????ng ki???m xe c??",
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
                        final snackBar = SnackBar(
                          content: const Text('??? C???m ??n b???n ???? s??? d???ng d???ch v??? c???a ch??ng t??i ???'),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          backgroundColor: Colors.blue,
                        ); ScaffoldMessenger.of(context)
                            .showSnackBar(snackBar);
                      },
                      child: const Text('HO??N T???T'),
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
                        Navigator.pop(context);
                      },
                      child: const Text('QUAY L???I'),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
