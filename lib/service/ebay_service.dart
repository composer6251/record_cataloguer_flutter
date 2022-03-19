
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:record_cataloguer/api/api_urls.dart';

class EbayService {

  static String ebayAuthorizationToken = '';

  static getEbayAuthorizationToken() {
    var url = Uri.https(ebaySandboxApiBaseUrl, ebaySandboxAuthorizationApiPath);
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
  static getEbayApiAlbum (url) {
    if (ebayAuthorizationToken == ''){
      ebayAuthorizationToken = getEbayAuthorizationToken()
          .then((response) => {
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

    // var url = Uri.https(ebaySandboxApiBaseUrl, ebaySandboxAuthorizationApiPath);
    // http.post(
    //   url,
    //
    // )
  }

  static testMyServer() {
    var url = Uri.parse('http://192.168.1.76');
    http.post(url).then((response) => print('response ' + response.statusCode.toString() + ' ' + response.body));
  }
}