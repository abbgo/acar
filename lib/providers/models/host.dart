import 'package:acar/models/host.dart';
import 'package:acar/providers/internet.dart';
import 'package:acar/providers/local_storadge.dart';
import 'package:acar/services/host.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hostsApiProvider = Provider<HostApiService>((ref) => HostApiService());

var fetchHostsByFileNameProvider =
    FutureProvider.family<ResultHosts, HostParams>(
  (ref, params) async {
    ResultHosts result = ResultHosts.defaultResult();
    String token = ref.read(tokenProvider);
    bool hasInternet =
        await ref.read(checkInternetConnProvider(params.context!).future);

    if (hasInternet) {
      try {
        List<Host> hosts = await ref
            .read(hostsApiProvider)
            .fetchHostsByFileName(token, params.filename);
        result = ResultHosts(error: '', hosts: hosts);
      } catch (e) {
        result = ResultHosts(error: e.toString());
      }
    }

    return result;
  },
);
