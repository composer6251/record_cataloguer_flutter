import 'package:flutter/cupertino.dart';

/// *
/// This holds immutable strings of the urls used in the application

// These API urls are to get the OAuth tokens required to talk to Ebays inventory APIs.
//https://developer.ebay.com/api-docs/static/oauth-client-credentials-grant.html
const ebaySandboxAuthorizationApiUrl = 'https://api.sandbox.ebay.com/identity/v1/oauth2/token';
const ebayProductionAuthorizationApiUrl = 'https://api.ebay.com/identity/v1/oauth2/token';

//Catalog API GET https://api.ebay.com/commerce/catalog/v1_beta/product/{epid}  // epid is ebay Identifier. //todo: What is it?
final catalogApiGetProduct = 'GET https://api.ebay.com/commerce/catalog/v1_beta/product/';
///Sandbox environment: This API location points to the Sandbox environment, the testing environment.
///Use this environment when you are in the development phase of your application life cycle—calls made
///to the Sandbox do not affect live listings, users, inventory, and so on.**/
const ebaySandboxApiUrl = 'https://api.sandbox.ebay.com';

//Production environment: This API location points to the production environment where you calls affect live listings, users, inventory, and so on.
const ebayProduction = 'https://api.ebay.com';

/// ACCESS KEYS
const ebaySandboxApiClientId = 'DavidFen-recordca-SBX-96ae2d65c-d44e5717';
const ebaySandboxApiClientSecret = 'SBX-6ae2d65c2f23-1ab7-45c9-8ac8-6048';

const unencodedClientIdSecret = 'DavidFen-recordca-SBX-96ae2d65c-d44e5717:SBX-6ae2d65c2f23-1ab7-45c9-8ac8-6048';
const encodedClientIdSecret = 'RGF2aWRGZW4tcmVjb3JkY2EtU0JYLTk2YWUyZDY1Yy1kNDRlNTcxNzpTQlgtNmFlMmQ2NWMyZjIzLTFhYjctNDVjOS04YWM4LTYwNDg=';