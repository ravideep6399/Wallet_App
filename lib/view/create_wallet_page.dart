import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_app/Utils/routes/routes_name.dart';
import 'package:wallet_app/res/components/button.dart';
import 'package:wallet_app/res/extra_texts.dart';
import 'package:wallet_app/viewmodel/auth_view_model.dart';
import 'package:wallet_app/viewmodel/create_wallet_view_model.dart';
import '../res/colors.dart';

class CreateWallet extends StatelessWidget {
  const CreateWallet({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthViewModel>(context);
    final create = Provider.of<CreateWalletViewModel>(context);
    bool walletCheck = create.walletCheck;
    return Scaffold(
      backgroundColor: ColorsApp.background,
      appBar: AppBar(
        shadowColor: ColorsApp.white,
        backgroundColor: ColorsApp.background,
        actions: [
          IconButton(
              onPressed: (() {
                auth.logOut(context);
              }),
              icon: const Icon(
                Icons.logout,
                color: ColorsApp.white,
              )),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                flex: 1,
                child: SizedBox(
                  child: Text(
                    LongLines.yourWallet,
                    style: TextStyle(color: ColorsApp.white, fontSize: 16),
                  ),
                ),
              ),
              LongButton(
                value: walletCheck ? "Login TO Wallet" : "Create Wallet",
                onPress: () {
                  if (!walletCheck) {
                    Navigator.pushNamed(context, RoutesName.walletCredentials);
                  } else {
                    create.setwalletCheck(false);
                    Navigator.pushReplacementNamed(context, RoutesName.wallet);
                  }
                },
                image: const AssetImage("assets/background2.jpeg"),
                color: ColorsApp.white, width: 325,
              )
            ],
          ),
        ),
      ),
    );
  }
}
