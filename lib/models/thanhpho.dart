class Thanhpho {
  int code;
  int focussed;
  List<City> city;

  Thanhpho({required this.code, required this.focussed, required this.city});

  factory Thanhpho.fromJson(Map<String, dynamic> json) {
    return Thanhpho(
        code : json['code'],
        focussed : json['focussed'], city: []
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['focussed'] = this.focussed;
    if (this.city != null) {
      data['city'] = this.city.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class City {
  int cityId;
  String name;

  City({required this.cityId, required this.name});

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
        cityId : json['cityId'],
        name : json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cityId'] = this.cityId;
    data['name'] = this.name;
    return data;
  }
}
