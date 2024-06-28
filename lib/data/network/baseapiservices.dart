abstract class BaseApiServices {

  //Base Api Services that are provided.....

  Future<dynamic> getGETApiResponse(String url,var queryParam,var header);
  Future<dynamic> getPOSTApiResponse(String url,dynamic data);
  Future<dynamic> getPOSTApiResponsewithheaders(String url,dynamic data,var headers);
}
