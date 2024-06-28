class CreateWalletResponseModel {
  String? status;
  String? message;
  String? walletName;
  String? userPin;
  String? network;
  String? publicKey;
  String? secretKey;

  CreateWalletResponseModel(
      {this.status,
      this.message,
      this.walletName,
      this.userPin,
      this.network,
      this.publicKey,
      this.secretKey});

  CreateWalletResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    walletName = json['walletName'];
    userPin = json['userPin'];
    network = json['network'];
    publicKey = json['publicKey'];
    secretKey = json['secretKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['walletName'] = walletName;
    data['userPin'] = userPin;
    data['network'] = network;
    data['publicKey'] = publicKey;
    data['secretKey'] = secretKey;
    return data;
  }
}
