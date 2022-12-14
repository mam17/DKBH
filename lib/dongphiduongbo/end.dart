import 'package:flutter/material.dart';

import '../main.dart';

class Hoantat extends StatefulWidget {
  @override
  State<Hoantat> createState() => _QRPageState();
}

class _QRPageState extends State<Hoantat> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isChecked = false;

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(top: 200),
              child: const Text("Cảm ơn bạn đã thanh toán toàn bộ phí đường bộ."+
                  " Tem đường bộ sẽ được gửi về địa chỉ trong vòng 2 ngày làm viêc.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              width: 120,
              margin: const EdgeInsets.only(bottom: 50),
              decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                child: const Text('HOÀN TẤT', style: TextStyle(fontSize: 15, color: Colors.white)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=>  const Home(
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
