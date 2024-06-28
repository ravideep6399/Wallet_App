class UserModel {
  String? status;
  int? balance;
  String? token;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  bool? isVerified;
  String? role;
  String? ownerId;
  String? walletAddress;
  bool? hasWallet;
  String? lastLogin;
  String? profilePictureUrl;

  UserModel(
      {this.status,
      this.balance,
      this.token,
      this.username,
      this.email,
      this.firstName,
      this.lastName,
      this.isVerified,
      this.role,
      this.ownerId,
      this.walletAddress,
      this.hasWallet,
      this.lastLogin,
      this.profilePictureUrl});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    balance = json['balance'];
    token = json['token'];
    username = json['username'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    isVerified = json['isVerified'];
    role = json['role'];
    ownerId = json['owner_id'];
    walletAddress = json['wallet_address'];
    hasWallet = json['has_wallet'];
    lastLogin = json['last_login'];
    profilePictureUrl = json['profile_picture_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    data['balance'] = balance;
    data['token'] = token;
    data['username'] = username;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['isVerified'] = isVerified;
    data['role'] = role;
    data['owner_id'] = ownerId;
    data['wallet_address'] = walletAddress;
    data['has_wallet'] = hasWallet;
    data['last_login'] = lastLogin;
    data['profile_picture_url'] = profilePictureUrl;
    return data;
  }
}
