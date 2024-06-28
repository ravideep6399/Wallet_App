import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wallet_app/Utils/routes/routes_name.dart';
import 'package:wallet_app/Utils/utils.dart';
import 'package:wallet_app/repository/create_wallet_repo.dart';
import 'package:wallet_app/viewmodel/wallet_view_model.dart';
import '../models/create_wallet_response_model.dart';

// CreateWallet View Model to create wallet....

class CreateWalletViewModel with ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  String _key = "Not Provided Yet";

  String get key => _key;

  setkey(String value) {
    _key = value;
    notifyListeners();
  }

  bool _walletCheck = false;

  bool get walletCheck => _walletCheck;

  void setwalletCheck(bool value) {
    _walletCheck = value;
    notifyListeners();
  }

  final repo = CreateWalletRepository();
  final wallet = WalletViewModel();
  Future<void> createWallet(dynamic data, BuildContext context) async {
    setloading(true);
    repo.create(data).then((value) {
      // if (kDebugMode) {
      //   print(value);
      // }
      setloading(false);
      if (value["message"] == "Wallet already exist") {
        setwalletCheck(true);
        Navigator.of(context).pop();
        throw ("Wallet already exist");
      } else if (value["status"] == "error") {
        throw ("error");
      }
      CreateWalletResponseModel res = CreateWalletResponseModel.fromJson(value);

      wallet.savePublicKey(res.publicKey.toString());
      Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.wallet, (route) => false);
    }).onError((error, stackTrace) {
      setloading(false);
      Utils.flushbarErrorMessage(error.toString(), context);
    });
  }
}
