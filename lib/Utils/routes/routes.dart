import 'package:flutter/material.dart';
import 'package:wallet_app/Utils/routes/routes_name.dart';
import 'package:wallet_app/main.dart';
import 'package:wallet_app/res/colors.dart';
import 'package:wallet_app/view/airdrop_view.dart';
import 'package:wallet_app/view/create_wallet_credentials.dart';
import 'package:wallet_app/view/create_wallet_page.dart';
import 'package:wallet_app/view/fund_transfer.dart';
import 'package:wallet_app/view/login_view.dart';
import 'package:wallet_app/view/wallet_view.dart';

class Routes {
  static MaterialPageRoute generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case RoutesName.createWallet:
        return MaterialPageRoute(builder: (context) => const CreateWallet());
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());  
      case RoutesName.walletCredentials:
        return MaterialPageRoute(builder: (context) => const CreateWalletCredentials());   
      case RoutesName.wallet:
        return MaterialPageRoute(builder: (context) => const WalletView()); 
      case RoutesName.send:
        return MaterialPageRoute(builder: (context) => const TransferFunds());    
      case RoutesName.airdrop:
        return MaterialPageRoute(builder: (context) => const AirdropAmount());  
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            backgroundColor: ColorsApp.background,
            body: Text(
              "No such Route Exist",
              style: TextStyle(color: ColorsApp.white),
            ),
          );
        });
    }
  }
}
