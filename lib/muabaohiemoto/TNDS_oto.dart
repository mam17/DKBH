import 'package:flutter/material.dart';

import 'chiphi_oto.dart';

class TNDS_oto extends StatefulWidget {

  @override
  _TNDS_otoState createState() => _TNDS_otoState();
}

class _TNDS_otoState extends State<TNDS_oto> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Image.asset('images/logo.png', width: 40,height: 40),
              const Text("MUA BẢO HIỂM TNDS XE Ô TÔ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
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
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
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
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
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
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Email',
                        hintText: 'Nhập email',
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
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        labelText: 'Mục đích sử dụng',
                        hintText: 'Mục đích sử dụng',
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
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        labelText: 'Loại xe',
                        hintText: 'Nhập loại xe',
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                    width: 150,
                    height: 80,
                    child: Column(
                      children: <Widget>[
                        TextField(
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                            labelText: 'Số chỗ ngồi',
                            hintText: 'Nhập số chỗ ngồi',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    height: 80,
                    child: Column(
                      children: <Widget>[
                        TextField(
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                            labelText: 'Tải trọng',
                            hintText: 'Nhập tải trọng',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 5),
                    child: const Text("Tải lên hình ảnh đăng ký xe"),
                  ),
                  Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(111, 70, 2, 1.0),
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                        child: const Text('UPLOAD', style: TextStyle(fontSize: 15, color: Colors.white)),
                        onPressed: (){}
                    ),
                  ),
                ],
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
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                        labelText: 'Lựa chọn hãng bảo hiểm',
                      ),
                    ),
                  ],
                ),
              ),
              const Text("*Khuyến cáo Khách hàng nên lựa chọn các hãng bảo hiểm có ấn chỉ điện tử",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      "Bao gồm người ngồi trên xe",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                width: 120,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                    child: const Text('Tiếp tục', style: TextStyle(fontSize: 15, color: Colors.white)),
                    onPressed:() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=>  CPoto(
                          ),
                        ),
                      );
                    }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}