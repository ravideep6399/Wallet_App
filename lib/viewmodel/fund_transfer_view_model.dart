import 'package:flutter/material.dart';
import 'package:wallet_app/Utils/utils.dart';
import 'package:wallet_app/repository/fund_transfer_repo.dart';

// to implement tranfer fund functionality....

class TransferFundViewModel with ChangeNotifier {
  final _repo = TransferFundRepository();
  bool _loading = false;

  bool get loading => _loading;

  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> transfer(String recipientAddress, int amount, String userPin,
      BuildContext context) async {
    setloading(true);
    _repo.fundTransfer(recipientAddress, amount, userPin).then((value) {
      setloading(false);
      Utils.flushbarErrorMessage(value.message.toString(), context);
    }).onError((error, stackTrace) {
      setloading(false);
      Utils.flushbarErrorMessage(error.toString(), context);
    });
  }
}
