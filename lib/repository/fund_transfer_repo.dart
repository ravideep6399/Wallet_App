import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_app/data/network/baseapiservices.dart';
import 'package:wallet_app/data/network/networkapiservices.dart';
import 'package:wallet_app/models/fund_transfer_response_model.dart';
import 'package:wallet_app/res/app_urls.dart';
import 'package:wallet_app/res/extra_texts.dart';

// fundtransfer repository used to implement fundtransfer funtionality....

class TransferFundRepository {
  final BaseApiServices _services = NetworkApiServices();

  Future<BalanceTransferResPonseModel> fundTransfer(
      String recipientAddress, int amount, String userPin) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token")!;
    String senderAddress = pref.getString("Public keys") ?? pref.getString("Wallet Address")!;
    var headers = {LongLines.tokenKey: token};
    Map data = {
      "recipient_address": recipientAddress,
      "network": "devnet",
      "sender_address": senderAddress,
      "amount": amount.toString(),
      "user_pin": userPin,
    };
    try {
      dynamic response = await _services.getPOSTApiResponsewithheaders(
          AppUrls.balanceTransfer, data, headers);
      return response = BalanceTransferResPonseModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
