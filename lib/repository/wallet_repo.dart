import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_app/data/network/baseapiservices.dart';
import 'package:wallet_app/data/network/networkapiservices.dart';
import 'package:wallet_app/models/balance_model.dart';
import 'package:wallet_app/res/app_urls.dart';
import 'package:wallet_app/res/extra_texts.dart';

//wallet repo used o implement getBalance Function to fetch balance in the wallet screen...

class WalletRepository {
  final BaseApiServices _services = NetworkApiServices();

  Future<BalanceModel> getWalletBalance() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? address = pref.getString("Public keys") ?? pref.getString("Wallet Address")!;
    String? token = pref.getString("token");
    var header = {LongLines.tokenKey: token!};
    final queryParam = {
      "network": LongLines.devnet,
      "wallet_address": address
    };
    try {
      dynamic response = await _services.getGETApiResponse(
          AppUrls.getWalleturl, queryParam, header);
      // print(response);
      return response = BalanceModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
