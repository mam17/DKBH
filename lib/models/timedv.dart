class TimeSlot {
  int code;
  List<String> data;

  TimeSlot({required this.code, required this.data});

  factory TimeSlot.fromJson(Map<String, dynamic> json) {
    return TimeSlot(code: json['code'], data: json['data'].cast<String>());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['data'] = this.data;
    return data;
  }
}
