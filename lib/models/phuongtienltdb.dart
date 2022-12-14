class phuongtienltdb {
  int vehicleId;
  String typeVehicle;
  String nameVehicle;

  phuongtienltdb({required this.vehicleId, required this.typeVehicle, required this.nameVehicle});

  factory phuongtienltdb.fromJson(Map<String, dynamic> json) {
    return phuongtienltdb(
        vehicleId : json['vehicleId'],
        typeVehicle : json['typeVehicle'],
        nameVehicle : json['nameVehicle'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vehicleId'] = this.vehicleId;
    data['typeVehicle'] = this.typeVehicle;
    data['nameVehicle'] = this.nameVehicle;
    return data;
  }
}
