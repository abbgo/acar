import 'package:acar/helpers/functions/methods/widgets.dart';
import 'package:acar/models/dates.dart';
import 'package:acar/providers/models/dates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DatesPage extends ConsumerWidget {
  const DatesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<ResultDates> files = ref.watch(fetchFilesProvider);

    return files.when(
      data: (data) {
        return const Center(child: Text('Dates page'));
      },
      error: (error, stackTrace) => errorMethod(error),
      loading: () => loadMethod(),
    );
  }
}
