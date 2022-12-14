class PriceDv {
  String costPkd;
  String costCert;
  String costPdb;
  String costService;
  String costTotalTemp;
  String voucherCode;

  PriceDv(
      {required this.costPkd,
        required this.costCert,
        required this.costPdb,
        required this.costService,
        required this.costTotalTemp,
        required this.voucherCode});

  factory PriceDv.fromJson(Map<String, dynamic> json) {
    return PriceDv(
      costPkd : json['costPkd'],
      costCert : json['costCert'],
      costPdb : json['costPdb'],
      costService : json['costService'],
      costTotalTemp : json['costTotalTemp'],
      voucherCode : json['voucherCode'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['costPkd'] = this.costPkd;
    data['costCert'] = this.costCert;
    data['costPdb'] = this.costPdb;
    data['costService'] = this.costService;
    data['costTotalTemp'] = this.costTotalTemp;
    data['voucherCode'] = this.voucherCode;
    return data;
  }
}
