class TimeDK {
  int code;
  List<Slot> slot;

  TimeDK({required this.code, required this.slot});

  factory TimeDK.fromJson(Map<String, dynamic> json) {
    return TimeDK(
      code : json['code'],
      slot: [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.slot != null) {
      data['slot'] = this.slot.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Slot {
  String time;
  int slot;

  Slot({required this.time, required this.slot});

  factory Slot.fromJson(Map<String, dynamic> json) {
    return Slot(
        time : json['time'],
        slot : json['slot']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['slot'] = this.slot;
    return data;
  }
}
