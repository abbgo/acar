import 'package:acar/helpers/functions/ping.dart';
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
    List<Host> resultHosts = [];

    String token = ref.read(tokenProvider);
    bool hasInternet =
        await ref.read(checkInternetConnProvider(params.context!).future);

    if (hasInternet) {
      try {
        List<Host> hosts = await ref
            .read(hostsApiProvider)
            .fetchHostsByFileName(token, params.filename);

        for (Host host in hosts) {
          bool isActive = await isActiveHost(host.hostname);
          if (isActive) {
            resultHosts.add(host);
          }
        }

        result = ResultHosts(error: '', hosts: resultHosts);
      } catch (e) {
        result = ResultHosts(error: e.toString());
      }
    }

    return result;
  },
);
