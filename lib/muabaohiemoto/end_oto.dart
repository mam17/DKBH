import 'package:flutter/material.dart';

import '../main.dart';
class HoanThanh_oto extends StatefulWidget {
  @override
  _HoanThanh_oto createState() => _HoanThanh_oto();
}

class _HoanThanh_oto extends State<HoanThanh_oto> {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const Text("Cảm ơn bạn đã mua bảo hiểm TNDS dành cho xe ô tô",
                style: TextStyle(fontSize: 15)),
            Container(
                margin: const EdgeInsets.all(10),
                child: const Text("Ấn chỉ điện tử sẽ được gửi về địa chỉ email của bạn qua ứng dụng SAUTO sau khi nhân viên bổ xung thông tin va xác nhận",
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,)
            ),
            Container(
              width: 120,
              margin: const EdgeInsets.only(top: 100),
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
