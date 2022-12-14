class Qrdv {
  String objectId;

  Qrdv({required this.objectId});

  factory Qrdv.fromJson(Map<String, dynamic> json) {
    return Qrdv(objectId : json['objectId']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = this.objectId;
    return data;
  }
}
