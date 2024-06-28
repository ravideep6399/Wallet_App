class BalanceModel {
  String? status;
  String? message;
  int? balance;

  BalanceModel({this.status, this.message, this.balance});

  BalanceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['balance'] = balance;
    return data;
  }
}