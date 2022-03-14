
import 'package:http/http.dart' as http;
import 'package:record_cataloguer/api/api_urls.dart';

class EbayService {

  static getEbayAuthorizationToken() {
    var url = Uri.https('api.sandbox.ebay.com', 'identity/v1/oauth2/token');
    http.post(
        url,
        headers: <String, String> {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Basic $encodedClientIdSecret',
        },
        body: {
          'grant_type': 'client_credentials'
        }
    ).then((response) => print(
        'API response code: ' + response.statusCode.toString() +
            '\nand body: ' + response.body));
  }
}