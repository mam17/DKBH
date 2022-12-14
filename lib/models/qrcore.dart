class QrCore {
  String code;

  QrCore({required this.code});

  factory QrCore.fromJson(Map<String, dynamic> json) {
    return QrCore(code :json['code']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    return data;
  }
}
