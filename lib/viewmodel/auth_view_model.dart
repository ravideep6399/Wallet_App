import 'package:flutter/material.dart';
import 'package:wallet_app/Utils/routes/routes_name.dart';
import 'package:wallet_app/Utils/utils.dart';
import 'package:wallet_app/models/usermodel.dart';
import 'package:wallet_app/repository/auth_repo.dart';
import 'package:wallet_app/viewmodel/user_view_model.dart';

// Auth View Model for authentication....

class AuthViewModel with ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  setloading(bool value) {
    _loading = value;
    notifyListeners();
  }

  final AuthRepository repo = AuthRepository();
  final users = UserViewModel();
  Future<void> login(dynamic data, BuildContext context) async {
    setloading(true);
    repo.loginWithUsernamePassword(data).then((value) {
      setloading(false);
      if (value["status"] == "error") {
        String message = value["message"];
        throw (message);
      }
      UserModel user = UserModel.fromJson(value);
      if (value["wallet_address"] == null || value["wallet_address"] == "") {
        Navigator.pushReplacementNamed(context, RoutesName.createWallet);
      } else {
        users.saveUser(user);
        Future.delayed(const Duration(seconds: 2));
        Navigator.pushReplacementNamed(context, RoutesName.wallet);
      }
    }).onError((error, stackTrace) {
      setloading(false);
      Utils.flushbarErrorMessage(error.toString(), context);
    });
  }

  void logOut(BuildContext context) {
    users.removeUser();

    Navigator.pushNamedAndRemoveUntil(
        context, RoutesName.login, (route) => false);
  }
}
