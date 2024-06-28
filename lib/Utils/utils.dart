import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:wallet_app/res/colors.dart';

class Utils {
  static void flushbarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          backgroundColor: ColorsApp.textFieldColor,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          padding: const EdgeInsets.all(10),
          duration: const Duration(seconds: 3),
          message: message,
          flushbarPosition: FlushbarPosition.TOP,
        )..show(context));
  }
}
