import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class BaseApi {
  final String baseUrl = "http://localhost:3000/";

  Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  Future<http.Response> _onTimeout() {
    throw const SocketException("Timeout during request");
  }

  Future<dynamic> get({required String endpoint}) async {
    final response = await http.get(Uri.parse(baseUrl + endpoint), headers: headers).timeout(
          const Duration(seconds: 5000),
          onTimeout: _onTimeout,
        );
    print(response.body);
    final responseJson = json.decode(response.body);
    return responseJson;
  }
}
