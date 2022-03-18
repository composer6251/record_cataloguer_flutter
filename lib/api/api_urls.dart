import 'package:flutter/cupertino.dart';

/// *
/// This holds immutable strings of the urls used in the application

//Production environment: This API location points to the production environment
// where you calls affect live listings, users, inventory, and so on.
const ebaySandboxApiBaseUrl = 'api.sandbox.ebay.com';
const ebayProductionBaseUri = 'api.ebay.com';

/*****AUTHORIZATION******/
// These API urls are to get the OAuth tokens required to talk to Ebays inventory APIs.
//https://developer.ebay.com/api-docs/static/oauth-client-credentials-grant.html
const ebaySandboxAuthorizationApiPath = '/identity/v1/oauth2/token';
const ebayProductionAuthorizationApiPath = '/identity/v1/oauth2/token';

/// ****PRODUCTION CATALOG API ENDPOINTS (https://developer.ebay.com/api-docs/commerce/catalog/resources/methods)*****///
/// GET https://api.ebay.com/commerce/catalog/v1_beta/product_summary/search?
// q=string&   // ex: q=catstephens,teaforthetillerman
// gtin=string&  // UPC
// mpn=string&
// category_ids=string&
// aspect_filter=AspectFilter&
// fieldgroups=string&
// limit=string&
// offset=string
const catalogApiSearchUrl = '/commerce/catalog/v1_beta/product_summary/search?';
const catalogApiGetProductUrl = '/commerce/catalog/v1_beta/product/';

/// ACCESS KEYS
const ebaySandboxApiClientId = 'DavidFen-recordca-SBX-96ae2d65c-d44e5717';
const ebaySandboxApiClientSecret = 'SBX-6ae2d65c2f23-1ab7-45c9-8ac8-6048';
const unencodedClientIdSecret = 'DavidFen-recordca-SBX-96ae2d65c-d44e5717:SBX-6ae2d65c2f23-1ab7-45c9-8ac8-6048';
const encodedClientIdSecret = 'RGF2aWRGZW4tcmVjb3JkY2EtU0JYLTk2YWUyZDY1Yy1kNDRlNTcxNzpTQlgtNmFlMmQ2NWMyZjIzLTFhYjctNDVjOS04YWM4LTYwNDg=';