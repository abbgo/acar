import 'package:acar/services/host.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hostsApiProvider = Provider<HostApiService>((ref) => HostApiService());
