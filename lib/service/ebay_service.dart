
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:record_cataloguer/api/api_urls.dart';

class EbayService {

  static String ebayAuthorizationToken = '';

  static getEbayAuthorizationToken() {
    var url = Uri.https('api.sandbox.ebay.com', 'identity/v1/oauth2/token');
    http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Basic $encodedClientIdSecret',
        },
        body: {
          'grant_type': 'client_credentials'
        }
    ).then((response) => {
        if (response.statusCode == 200){
          ebayAuthorizationToken = response.body,
          print(
              'API response code: ' + response.statusCode.toString() +
                  '\nand body: ' + response.body.toString())
        }
        else {
            log('Received error from ebay auth endpoint with status code: ' +
                response.statusCode.toString() + ' and message: ' + response.body)
        }
    });
  }

  //todo: Finish!!!!
  static getEbayApiAlbum() {
    if (ebayAuthorizationToken == ''){
      getEbayAuthorizationToken();
    }

    var url = Uri.https('authority', 'unencodedPath');
    // http.post(
    //   url,
    //
    // )
  }
}