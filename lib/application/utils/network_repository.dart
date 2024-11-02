import 'package:http/http.dart';
import 'package:meni/application/utils/network_interface.dart';

const String baseUrl = 'https://horoscope-app-api.vercel.app/api/v1';

class NetworkRepository implements NetworkInterface {
  @override
  Future<Response> getRequest(String endpoint, String parameters) async {
    return await get(Uri.parse(baseUrl + endpoint + parameters));
  }
}
