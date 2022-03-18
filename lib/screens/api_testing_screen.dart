import 'package:flutter/material.dart';
import 'package:record_cataloguer/api/api_urls.dart';
import 'package:record_cataloguer/service/ebay_service.dart';
import 'package:record_cataloguer/widgets/add_album_widget.dart';

class ApiTestingScreen extends StatefulWidget {
  const ApiTestingScreen({Key? key}) : super(key: key);

  @override
  State<ApiTestingScreen> createState() => _ApiTestingScreenState();
}

void callEbaySearchEndpointSandbox(url) {
  EbayService.getEbayApiAlbum(url);
}

class _ApiTestingScreenState extends State<ApiTestingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Api Testing'
        ),
      ),
      body: Column(
        children: [
          AddAlbumWidget(EbayService.getEbayAuthorizationToken),
          SizedBox(
            height: 80,
          ),
          ElevatedButton(
            child: Text('Test Sandbox Search Endpoint'),
            onPressed: () => callEbaySearchEndpointSandbox(ebaySandboxApiBaseUrl + catalogApiSearchUrl + 'q=catstevens'),
          )
      ],
      ),
    );
  }
}
