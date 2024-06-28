import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:wallet_app/data/data_exception.dart';
import 'package:wallet_app/data/network/baseapiservices.dart';


// network api services that are provided and implement and inherit the baseapiservice abstract class.

class NetworkApiServices extends BaseApiServices {
  @override
  // implementing Get api method using HTTP
  Future getGETApiResponse(String url, var queryParam, var header) async {
    dynamic responseJson;
    try {
      final uri = Uri.parse(url);
      final newUri = uri.replace(queryParameters: queryParam);
      final response = await http
          .get(newUri, headers: header)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  // implementing post api method using HTTP
  Future getPOSTApiResponse(String url, data) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  // implementing post api method with headers using HTTP
  Future getPOSTApiResponsewithheaders(String url, data, headers) async {
    final response = await http
        .post(Uri.parse(url), body: data, headers: headers)
        .timeout(const Duration(seconds: 20));
    if (response.statusCode == 201) {
      // print(response);
      return jsonDecode(response.body);
    } else if (response.statusCode == 200) {
      // print(response);
      return jsonDecode(response.body);
    } else if (response.statusCode == 409) {
      // print(response.body);
      return jsonDecode(response.body);
    } else {
      // print(response.body);
      throw FetchDataException(
          '${response.reasonPhrase} ${response.statusCode}');
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw FetchDataException(
            '${response.reasonPhrase}. "${response.statusCode}"');
    }
  }
}
