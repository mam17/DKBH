class TramDk {
  int cityId;
  int stationId;
  String stationName ;

  TramDk({ required this.cityId, required this.stationName,required this.stationId});

  factory TramDk.fromJson(Map<String, dynamic> json) {
    return TramDk(
      cityId : json['cityId'],
      stationId: json['stationId'],
      stationName : json['stationName'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cityId'] = this.cityId;
    data['stationId']=this.stationId;
    data['stationName'] = this.stationName;
    return data;
  }
}