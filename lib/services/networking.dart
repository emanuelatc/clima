import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NetworkHelper {
  NetworkHelper(this.urlSource);
  final String urlSource;

  Future getData() async {
    var uri = Uri.parse(urlSource);
    final String host = uri.host;
    final String path = uri.path;
    final Map queryParameters = uri.queryParameters;

    Uri url = Uri.https('$host', '$path', queryParameters);
    print('$url');
    http.Response response = await http.get(url);

    // Uri url = Uri.https('api.openweathermap.org', 'data/2.5/weather',
    //     {'lat': '$latitude', 'lon': '$longitude', 'appid': '$apiKey'});

    if (response.statusCode == 200) {
      String data = response.body;
      return convert.jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
