import 'package:http/http.dart';

abstract class NetworkInterface {
  Future<Response> getRequest(String endpoint, String paramteres);
}