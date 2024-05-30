import 'package:dart_ping/dart_ping.dart';

Future<bool> isActiveHost(String host) async {
  bool result = true;
  try {
    final ping = Ping(host, count: 2);

    ping.stream.listen(
      cancelOnError: false,
      (event) {
        if (event.error != null) {
          result = false;
        }
      },
      onDone: () {},
      onError: (error) {
        result = false;
      },
    );
  } catch (e) {
    result = false;
  }
  return result;
}
