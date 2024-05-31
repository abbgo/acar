import 'dart:math';

Future<String> generateUUID() async {
  final random = Random.secure();

  final bytes = List<int>.generate(16, (i) => random.nextInt(256));

  bytes[6] = (bytes[6] & 0x0F) | 0x40;
  bytes[8] = (bytes[8] & 0x3F) | 0x80;

  final StringBuffer uuid = StringBuffer();
  for (int i = 0; i < bytes.length; i++) {
    if (i == 4 || i == 6 || i == 8 || i == 10) {
      uuid.write('-');
    }
    uuid.write(bytes[i].toRadixString(16).padLeft(2, '0'));
  }
  return uuid.toString();
}
