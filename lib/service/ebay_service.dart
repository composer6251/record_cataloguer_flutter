import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:record_cataloguer/api/api_urls.dart';

class EbayService {

  static String ebayAuthorizationToken = '';

  // static getEbayAuthorizationToken() {
  //   var url = Uri.https(ebaySandboxApiBaseUrl, ebaySandboxAuthorizationApiPath);
  //   http.post(
  //       url,
  //       headers: <String, String>{
  //         'Content-Type': 'application/x-www-form-urlencoded',
  //         'Authorization': 'Basic $encodedClientIdSecret',
  //       },
  //       body: {
  //         'grant_type': 'client_credentials'
  //       }
  //   ).then((response) => {
  //       if (response.statusCode == 200){
  //         ebayAuthorizationToken = response.body,
  //         print(
  //             'API response code: ' + response.statusCode.toString() +
  //                 '\nand body: ' + response.body.toString())
  //       }
  //       else {
  //           log('Received error from ebay auth endpoint with status code: ' +
  //               response.statusCode.toString() + ' and message: ' + response.body)
  //       }
  //   });
  // }

  //todo: Finish!!!!
  // static getEbayApiAlbum (String url, String queryParams) {
  //   // if (ebayAuthorizationToken == ''){
  //   //   ebayAuthorizationToken = getEbayAuthorizationToken()
  //   //       .then((response) => {
  //   //         if (response.statusCode == 200){
  //   //           ebayAuthorizationToken = response.body
  //   //         },
  //   //         printResponse(response, endpoint: 'get authorization')
  //   //     });
  //   // }
  //   var encodedQueryParams = Uri.encodeQueryComponent(queryParams);
  //
  //   var testUrl = 'https://api.sandbox.ebay.com/buy/browse/v1/item_summary/'
  //       'search?search?q=brakes&category_ids=33559&compatibility_filter='
  //       'Year%3A2012%3BMake%3AHonda%3BModel%3ACivic%3BTrim%3AEX%20Sedan%204-'
  //       'Door%3BEngine%3A1.8L%201799CC%20l4%20GAS%20SOHC%20Naturally%20Aspirated';
  //
  //   var testAuthority = 'api.sandbox.ebay.com';
  //   var testUnencodedPath = '/buy/browse/v1/item_summary/search?search?';
  //   Map<String, String> testQueryParams = {
  //     'q': 'guitar'
  //   };
  //   var testUri = Uri.https(testAuthority, testUnencodedPath, testQueryParams);
  //   var uri = Uri.https(ebaySandboxApiBaseUrl, ebaySandboxAuthorizationApiPath + encodedQueryParams);
  //   printRequest(testUri);
  //   http.post(
  //     uri,
  //   ).then((response) => {
  //     printResponse(response, endpoint: 'search')
  //   });
  // }

  static getEbayAuthorization() {
    print('sending request for ebay auth');
    var uri = Uri.http(sgLaptopAuthority, getEbayAuthEndpoint);
    printRequest(uri);
    http.get(uri).then((response) => {
      printResponse(response, endpoint: 'my server')
    });
  }

  static printRequest(Uri uri) {
    print('sending request Uri: ' + uri.toString());
  }

  static printResponse(Response response, {String endpoint = 'endpoint'}) {
    print('testing ' + endpoint + ' endpoint response status: '
        + response.statusCode.toString() +
        '\n and body: ' + response.body);
  }
}