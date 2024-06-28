import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_app/data/network/baseapiservices.dart';
import 'package:wallet_app/data/network/networkapiservices.dart';
import 'package:wallet_app/models/airdrop_response_model.dart';
import 'package:wallet_app/res/app_urls.dart';
import 'package:wallet_app/res/extra_texts.dart';

// Airdrop repo used for Airdrop functionality.....

class AirDropRepository{
  final BaseApiServices _services = NetworkApiServices();

  Future<AirdropResponseModel> requestAirdrop(double amount) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token")!;
    String senderAddress = pref.getString("Wallet Address")!;
    var headers = {LongLines.tokenKey: token};
    Map data = {
      "wallet_address": senderAddress,
      "network": "devnet",
      "amount": amount.toString(),
    };
    try {
      dynamic response = await _services.getPOSTApiResponsewithheaders(
          AppUrls.airdrop, data, headers);
      return response = AirdropResponseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}