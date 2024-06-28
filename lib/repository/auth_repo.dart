import 'package:wallet_app/data/network/baseapiservices.dart';
import 'package:wallet_app/data/network/networkapiservices.dart';
import 'package:wallet_app/res/app_urls.dart';

// Authetication repository

class AuthRepository {
  final BaseApiServices _services = NetworkApiServices();

  Future<dynamic> loginWithUsernamePassword(dynamic data) async {
    try {
      dynamic response = _services.getPOSTApiResponse(AppUrls.loginurl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
