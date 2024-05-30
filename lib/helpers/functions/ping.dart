import 'dart:async';
import 'package:dart_ping/dart_ping.dart';

Future<bool> isActiveHost(String host) async {
  bool result = true;
  final Completer<bool> completer = Completer<bool>();

  try {
    final ping = Ping(host, count: 2);

    ping.stream.listen(
      cancelOnError: false,
      (event) {
        if (event.error != null) {
          result = false;
        }
      },
      onDone: () {
        completer.complete(result);
      },
      onError: (error) {},
    );
  } catch (e) {
    //
  }
  return completer.future;
}
