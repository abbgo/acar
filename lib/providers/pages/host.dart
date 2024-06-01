import 'package:acar/models/host.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResultHostsProvider extends StateNotifier<List<Host>> {
  ResultHostsProvider() : super([]);

  Future<void> addHost(Host host) async {
    state = [...state, host];
  }
}

final resultHostsProvider =
    StateNotifierProvider.autoDispose<ResultHostsProvider, List<Host>>(
  (ref) => ResultHostsProvider(),
);
final loadHostsProvider = StateProvider.autoDispose<bool>((ref) => true);
