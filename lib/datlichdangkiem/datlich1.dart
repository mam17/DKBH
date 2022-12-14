import 'dart:convert';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/phuongtienDK.dart';
import '../models/phuongtienltdb.dart';
import '../models/time.dart';

import 'package:http/http.dart' as http;

import 'chiphi.dart';

class DatlichDK extends StatefulWidget {
  late int idStation;
  late String? bsx;
  late String? hoten;
  late String? sdt;
  int tp;
  int tramdk;

  DatlichDK({
    Key? key,
    required this.idStation,
    required this.bsx,
    required this.hoten,
    required this.sdt,
    required this.tp,
    required this.tramdk,
  }) : super(key: key);
  @override
  _State createState() => _State();
}

class _State extends State<DatlichDK> {
  var controllerHangxe = TextEditingController();

  DateTime? selectedDate = DateTime.now();
  String? valueDate;
  Slot? selectTime;
  List<Slot> listTime = [];

  Object? _value = true;
  Object? _users = true;

  phuongtiendk? selectPTDK;
  List<phuongtiendk> listPTDK = [];
  phuongtienltdb? selectltdb;
  List<phuongtienltdb> listltdb = [];

  List<int> listYear = [];
  int? selectYear;
  getYear() async {
    const String url = 'https://api.dangkiem.online/api/Year';
    var response = await http.get(Uri.parse(url));
    List<int> jsonResponse = jsonDecode(response.body).cast<int>();
    setState(() {
      listYear = jsonResponse;
    });
  }

  getphuongtienDK() async {
    String url = 'https://api.dangkiem.online/api/Vehicle/false';
    http.Response response = await http.get(Uri.parse(url));
    List<dynamic> jsonResponse = jsonDecode(response.body);
    setState(() {
      listPTDK = List<phuongtiendk>.from(
          jsonResponse.map((PTDK) => phuongtiendk.fromJson(PTDK)));
    });
  }

  getphuongtienLTDB() async {
    String url = 'https://api.dangkiem.online/api/Vehicle/true';
    http.Response response = await http.get(Uri.parse(url));
    List<dynamic> jsonResponse = jsonDecode(response.body);
    setState(() {
      listltdb = List<phuongtienltdb>.from(
          jsonResponse.map((LTDB) => phuongtienltdb.fromJson(LTDB)));
    });
  }

  getthoigian(String date) async {
    var stt = widget.idStation;
    String url =
        'https://api.dangkiem.online/api/Slot?datetime=$date&stationId=$stt';
    http.Response response = await http.get(Uri.parse(url));
    List<dynamic> jsonResponse = jsonDecode(response.body)["slot"];
    setState(() {
      listTime = List<Slot>.from(jsonResponse.map((TG) => Slot.fromJson(TG)));
    });
  }

  onChaneCiy(String value) {
    setState(() {
      valueDate = value;
      selectTime = null;
    });
    var date = value;
    getthoigian(date);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getphuongtienDK();
    getphuongtienLTDB();
    getYear();
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
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Image.asset('images/logo.png', width: 40, height: 40),
              const Text(
                'ĐẶT DỊCH VỤ ĐĂNG KIỂM',
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
              SizedBox(
                width: 350,
                height: 70,
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: controllerHangxe,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Hãng xe',
                        hintText: 'Nhập hãng xe',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 350,
                padding: const EdgeInsets.only(top: 8, left: 10, bottom: 4),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20)),
                child: DropdownButton<int>(
                    underline: Container(color: Colors.transparent),
                    hint: const Text(
                      "Năm sản xuất",
                      style: TextStyle(fontSize: 17),
                    ),
                    value: selectYear,
                    iconSize: 25,
                    isExpanded: true,
                    items: listYear.map((item) {
                      return DropdownMenuItem<int>(
                        value: item,
                        child: Text('$item'),
                      );
                    }).toList(),
                    onChanged: (value) => setState(() {
                      selectYear = value;
                    })),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0),
                child: Row(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text("Hình thức: ",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Radio(
                                value: true,
                                groupValue: _users,
                                onChanged: (value) {
                                  setState(() {
                                    _users = value;
                                  });
                                }),
                            const Text("Có kinh doanh vận tải")
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Radio(
                                value: false,
                                groupValue: _users,
                                onChanged: (value) {
                                  setState(() {
                                    _users = value;
                                  });
                                }),
                            const Text("Không kinh doanh vận tải")
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 106.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const Text("Sở hữu: ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Row(
                      children: <Widget>[
                        Radio(
                            value: true,
                            groupValue: _value,
                            onChanged: (value) {
                              setState(() {
                                _value = value;
                              });
                            }),
                        const Text("Cá nhân")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Radio(
                            value: false,
                            groupValue: _value,
                            onChanged: (value) {
                              setState(() {
                                _value = value;
                              });
                            }),
                        const Text("Doanh nghiệp")
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 350,
                padding: const EdgeInsets.only(top: 8, left: 10, bottom: 4),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20)),
                child: DropdownButton<phuongtiendk>(
                  underline: Container(color: Colors.transparent),
                  hint: const Text("Loại phương tiện theo đăng kiểm"),
                  value: selectPTDK,
                  iconSize: 36,
                  isExpanded: true,
                  items: listPTDK.map((phuongtiendk item) {
                    return DropdownMenuItem<phuongtiendk>(
                      value: item,
                      child: Text(" ${item.nameVehicle}"),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectPTDK = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 350,
                padding: const EdgeInsets.only(top: 8, left: 10, bottom: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: DropdownButton<phuongtienltdb>(
                  underline: Container(color: Colors.transparent),
                  hint: const Text(
                      "Loại phương tiện theo qui định lưu thông đường bộ"),
                  dropdownColor: Colors.grey,
                  value: selectltdb,
                  iconSize: 36,
                  isExpanded: true,
                  items: listltdb.map((phuongtienltdb item) {
                    return DropdownMenuItem<phuongtienltdb>(
                      value: item,
                      child: Text(
                        " ${item.nameVehicle}",
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectltdb = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 360,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 150,
                      padding: const EdgeInsets.only(top: 8),
                      child: DateTimePicker(
                        type: DateTimePickerType.date,
                        dateMask: 'dd/MM/yyyy',
                        initialDatePickerMode: DatePickerMode.day,
                        firstDate: selectedDate,
                        lastDate: DateTime(2100),
                        initialDate: selectedDate,
                        icon: const Icon(Icons.date_range),
                        dateLabelText: 'Ngày đăng kiểm',
                        calendarTitle: 'Chọn ngày đăng kiểm',
                        cancelText: 'Huỷ bỏ',
                        confirmText: 'Xong',
                        onChanged: (value) {
                          setState(() {
                            onChaneCiy(value);
                          });
                        },
                      ),
                    ),
                    Container(
                      width: 180,
                      padding: const EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20)),
                      child: DropdownButton<Slot>(
                        underline: Container(color: Colors.transparent),
                        hint: const Text(" Chọn thời gian"),
                        dropdownColor: Colors.grey,
                        value: selectTime,
                        iconSize: 36,
                        isExpanded: true,
                        items: listTime.map((Slot item) {
                          return DropdownMenuItem<Slot>(
                            value: item,
                            child: Text(" Time: ${item.time} Slot: ${item.slot}"),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectTime = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: 120,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  child: const Text('TIẾP TỤC',
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                  onPressed: () {
                    if (controllerHangxe.text.isEmpty ||
                        listYear.isEmpty ||
                        listTime.isEmpty ||
                        listltdb.isEmpty ||
                        listPTDK.isEmpty) {
                      const snackBar =
                      SnackBar(content: Text("Không được để trống"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Chiphi(
                            namsx: selectYear as int,
                            bsx: widget.bsx,
                            vehiclepdbId: selectltdb!.vehicleId,
                            vehiclepkdId: selectPTDK!.vehicleId,
                            user: _value,
                            uses: _users,
                            hoten: widget.hoten,
                            sdt: widget.sdt,
                            tp: widget.tp,
                            tramdk: widget.tramdk,
                            hangxe: controllerHangxe.text,
                            loaipttdk: selectPTDK!.vehicleId,
                            ptdkltdb: selectltdb!.vehicleId,
                            ngay: valueDate,
                            slot: selectTime!.slot,
                            tg: selectTime!.time,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}