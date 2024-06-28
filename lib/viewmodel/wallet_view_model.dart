import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_app/Utils/utils.dart';
import 'package:wallet_app/data/response/api_reponse.dart';
import 'package:wallet_app/models/balance_model.dart';
import 'package:wallet_app/repository/wallet_repo.dart';

//View model to manage Wallet view ....

class WalletViewModel with ChangeNotifier {
  final _repo = WalletRepository();

  ApiResponse<BalanceModel> balance = ApiResponse.loading();

  setBalance(ApiResponse<BalanceModel> response) {
    balance = response;
    notifyListeners();
  }

  Future<void> savePublicKey(String publicKey) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("Public keys", publicKey);
    notifyListeners();
  }

  Future<void> getBalance(BuildContext context) async {
    _repo.getWalletBalance().then((value) {
      setBalance(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setBalance(ApiResponse.error(error.toString()));
      Utils.flushbarErrorMessage(error.toString(), context);
      // print(error);
    });
  }
}
