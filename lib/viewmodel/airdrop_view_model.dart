import 'package:flutter/material.dart';
import 'package:wallet_app/Utils/utils.dart';
import 'package:wallet_app/repository/airdrop_repo.dart';

// Airdrop view Model .........

class AirdropViewModel with ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  final _repo = AirDropRepository();
  Future<void> airdrop(double amount, BuildContext context) async {
    setloading(true);
    _repo.requestAirdrop(amount).then((value) {
      setloading(false);
      Utils.flushbarErrorMessage(value.message.toString(), context);
    }).onError((error, stackTrace) {
      setloading(false);
      Utils.flushbarErrorMessage(error.toString(), context);
    });
  }
}
