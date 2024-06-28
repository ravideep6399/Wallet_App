// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:wallet_app/models/usermodel.dart';
import 'package:wallet_app/viewmodel/create_wallet_view_model.dart';
import 'package:wallet_app/viewmodel/user_view_model.dart';

import '../../Utils/routes/routes_name.dart';

class SplashServices {
  CreateWalletViewModel wallet = CreateWalletViewModel();

  Future<UserModel> getUserModel() {
    return UserViewModel().getUser();
  }

 // service to check if user is logged in already. Used to manage User Session. uses UserViewModel().getUser() method.

  void checkAuthentication(BuildContext context) {
    getUserModel().then((value) async {

      // ignore: duplicate_ignore

      if (value.token == null || value.token == "") {
        await Future.delayed(const Duration(seconds: 2));

        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.login, (route) => false);
      } else if (value.walletAddress == null || value.walletAddress == "") {
        await Future.delayed(const Duration(seconds: 2));
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.createWallet, (route) => false);
      } else {

        // print(value.walletAddress.toString());
        // print(value.token);

        await Future.delayed(const Duration(seconds: 2));
        Navigator.pushNamedAndRemoveUntil(
            context, RoutesName.wallet, (route) => false);
      }
    }).onError((error, stackTrace) => null);
  }
}
