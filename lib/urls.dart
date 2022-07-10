import 'package:http/http.dart';

Future<Response> leftRobot() {
  return get(Uri.parse("http://192.168.252.250/left"));
}

Future<Response> rightRobot() {
  return get(Uri.parse("http://192.168.252.250/right"));
}

Future<Response> stopRobot() {

  return get(Uri.parse("http://192.168.252.250/stop"));
}
Future<Response> fowardRobot() {

  return get(Uri.parse("http://192.168.252.250/foward"));
}
Future<Response> backwardRobot() {

  return get(Uri.parse("http://192.168.252.250/backward"));
  
}



