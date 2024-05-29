import 'package:acar/models/dates.dart';
import 'package:acar/providers/internet.dart';
import 'package:acar/providers/local_storadge.dart';
import 'package:acar/services/dates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateApiProvider = Provider<DatesApiService>((ref) => DatesApiService());

var fetchFilesProvider = FutureProvider.family<ResultDates, BuildContext>(
  (ref, context) async {
    ResultDates result = ResultDates.defaultResult();
    String token = ref.read(tokenProvider);
    bool hasInternet =
        await ref.read(checkInternetConnProvider(context).future);

    if (hasInternet) {
      try {
        List<Dates> files = await ref.read(dateApiProvider).fetchFiles(token);
        result = ResultDates(error: '', dates: files);
      } catch (e) {
        result = ResultDates(error: e.toString());
      }
    }

    return result;
  },
);
