import 'package:app1/datlichdangkiem/qr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Thanhtoan extends StatefulWidget {
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
  String? voucherCode;
  bool useService;
  Thanhtoan({
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
  _State createState() => _State();
}

class _State extends State<Thanhtoan> {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Image.asset('images/logo.png', width: 40, height: 40),
            const Text(
              'THANH TOÁN',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.normal,
              ),
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: Colors.orangeAccent,
                width: 250,
                height: 130,
                child: TextButton.icon(
                  icon: const Icon(
                    Icons.payments_sharp,
                    color: Colors.black,
                  ),
                  label: const Text(
                    'THANH TOÁN TRỰC TUYẾN',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: Colors.brown,
                width: 250,
                height: 130,
                child: TextButton.icon(
                  icon: const Icon(
                    Icons.payment_sharp,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'THANH TOÁN TRỰC TIẾP',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QRPage(
                            hoten: widget.hoten,
                            sdt: widget.sdt,
                            bsx: widget.bsx,
                            namsx: widget.namsx,
                            tp: widget.tp,
                            tramdk: widget.tramdk,
                            hangxe: widget.hangxe,
                            pttdk: widget.pttdk,
                            ltdb: widget.ltdb,
                            day: widget.day,
                            slot: widget.slot,
                            time: widget.time,
                            voucherCode: widget.voucherCode,
                            user: widget.user,
                            uses: widget.uses,
                            useService: widget.useService),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}