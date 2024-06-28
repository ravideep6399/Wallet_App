import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallet_app/data/network/baseapiservices.dart';
import 'package:wallet_app/data/network/networkapiservices.dart';
import 'package:wallet_app/res/app_urls.dart';
import 'package:wallet_app/res/extra_texts.dart';

class CreateWalletRepository {
  final BaseApiServices _services = NetworkApiServices();

  // repository used to create wallet using the BaseApiServices.

  Future<dynamic> create(dynamic data) async {

    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token")!;
    var headers = {LongLines.tokenKey: token};

    // print(headers);
    
    try {
      dynamic response =
          _services.getPOSTApiResponsewithheaders(AppUrls.createWalleturl, data, headers);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
