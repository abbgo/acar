import 'package:acar/models/dates.dart';
import 'package:acar/providers/local_storadge.dart';
import 'package:acar/services/dates.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateApiProvider = Provider<DatesApiService>((ref) => DatesApiService());

var fetchFilesProvider = FutureProvider<ResultDates>(
  (ref) async {
    ResultDates result = ResultDates.defaultResult();
    String token = ref.read(tokenProvider);

    try {
      List<Dates> files = await ref.read(dateApiProvider).fetchFiles(token);
      result = ResultDates(error: '', dates: files);
    } catch (e) {
      result = ResultDates(error: e.toString());
    }
    return result;
  },
);
