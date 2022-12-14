
import 'package:app1/datdichvudangkiem/qrdv.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThanhtoanDV extends StatefulWidget {

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
  ThanhtoanDV(
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
  _State createState() => _State();
}

class _State extends State<ThanhtoanDV> {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Image.asset('images/logo.png', width: 40,height: 40),
            const Text('THANH TOÁN',
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
                  label: const Text('THANH TOÁN TRỰC TUYẾN',
                    style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                  },
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
                  label: const Text('THANH TOÁN TRỰC TIẾP',
                    style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context)=> QRDV(
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
                            voucher: widget.voucher
                        ),
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