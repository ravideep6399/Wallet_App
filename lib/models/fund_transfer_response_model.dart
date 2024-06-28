class BalanceTransferResPonseModel {
  String? status;
  String? message;
  String? transactionId;

  BalanceTransferResPonseModel({this.status, this.message, this.transactionId});

  BalanceTransferResPonseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    transactionId = json['transaction_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['transaction_id'] = transactionId;
    return data;
  }
}
