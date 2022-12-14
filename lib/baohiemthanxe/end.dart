import 'package:flutter/material.dart';

import '../main.dart';
class VCX_end extends StatefulWidget {

  @override
  _VCX_endState createState() => _VCX_endState();
}

class _VCX_endState extends State<VCX_end> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text("CỔNG DỊCH VỤ ĐĂNG KIỂM",
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
            Container(
                child: Text("Cảm ơn bạn đã mua bảo hiểm vật chất xe",
                    style: TextStyle(fontSize: 15))
            ),
            Container(
                margin: EdgeInsets.all(10),
                child: Text("Ấn chỉ điện tử sẽ được gửi về địa chỉ email của bạn qua ứng dụng SAUTO sau khi nhân viên bổ xung thông tin va xác nhận",
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,)
            ),
            Container(
              width: 120,
              margin: EdgeInsets.only(top: 100),
              decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                child: const Text('HOÀN TẤT', style: TextStyle(fontSize: 15, color: Colors.white)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=>  Home(
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
