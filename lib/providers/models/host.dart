import 'package:acar/helpers/functions/ping.dart';
import 'package:acar/models/host.dart';
import 'package:acar/providers/internet.dart';
import 'package:acar/providers/local_storadge.dart';
import 'package:acar/providers/pages/host.dart';
import 'package:acar/services/host.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hostsApiProvider = Provider<HostApiService>((ref) => HostApiService());

var fetchHostsByFileNameProvider = FutureProvider.family<void, HostParams>(
  (ref, params) async {
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
            ref.read(resultHostsProvider.notifier).addHost(host);
          }
        }

        ref.read(loadHostsProvider.notifier).state = false;
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
    }
  },
);
