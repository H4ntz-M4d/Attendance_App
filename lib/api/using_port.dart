import 'dart:io';

void main() async {
  final HttpServer httpServer = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
  print('Server started on port: ${httpServer.port}');

  await for (HttpRequest request in httpServer) {
    request.response.write('Hello, world!');
  
  }
;}