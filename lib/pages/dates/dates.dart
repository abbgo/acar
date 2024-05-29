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

    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
      child: files.when(
        data: (data) {
          if (data.error != '') {
            return const Center(child: Text('Yalnyslyk yuze cykdy'));
          }

          List<Dates> files = data.dates!;
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: files.length,
            itemBuilder: (context, index) {
              Dates file = files[index];
              return Card(
                color: Colors.blueAccent,
                elevation: 3,
                child: ListTile(
                  onTap: () {},
                  title: Text(
                    file.name.substring(0, 10),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          );
        },
        error: (error, stackTrace) => errorMethod(error),
        loading: () => loadMethod(),
      ),
    );
  }
}
