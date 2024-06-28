import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_app/models/usermodel.dart';

// User View Model to implement user seesion management....

class UserViewModel with ChangeNotifier {
  Future<void> saveUser(UserModel user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("token", user.token.toString());
    await pref.setString("userName", user.username.toString());
    await pref.setString("Wallet Address", user.walletAddress.toString());
    notifyListeners();
  }

  Future<UserModel> getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final String? token = pref.getString("token");
    final String? username = pref.getString("userName");
    String? walletAddress = pref.getString("Wallet Address");
    if (walletAddress == null || walletAddress == "") {
      walletAddress = pref.getString("Public keys");
    }
    return UserModel(
      token: token,
      username: username,
      walletAddress: walletAddress,
    );
  }

  Future<bool> removeUser() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.clear();
  }
}
