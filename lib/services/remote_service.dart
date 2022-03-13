import 'package:cryptoapp/models/assets_model.dart';

import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Assets>?> getCurrencyDetails() async {
    var client = http.Client();
    var uri = Uri.parse('https://rest.coinapi.io/v1/assets');
    Map<String, String> header = {
      'X-CoinAPI-Key': '121A6F4C-8EEA-4E3D-9405-23900B633B34'
    };

    var response = await client.get(
      uri,
      headers: header,
    );

    if (response.statusCode == 200) {
      var json = response.body;
      print(json);
      return assetsFromJson(json);
    }
  }
}
