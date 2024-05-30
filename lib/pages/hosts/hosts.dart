import 'package:acar/helpers/functions/methods/widgets.dart';
import 'package:acar/models/host.dart';
import 'package:acar/providers/models/host.dart';
import 'package:acar/services/host.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HostsPage extends StatelessWidget {
  const HostsPage({super.key, required this.filename});

  final String filename;

  Future<void> copyToClipboard(String text) async {
    Clipboard.setData(ClipboardData(text: text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Hosts'),
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Consumer(
          builder: (context, ref, child) {
            HostParams params =
                HostParams(context: context, filename: filename);
            var hosts = ref.watch(fetchHostsByFileNameProvider(params));

            return hosts.when(
              data: (data) {
                if (data.error != '' || data.hosts == null) {
                  return const Center(child: Text('Yalnyslyk yuze cykdy'));
                }

                List<Host> hosts = data.hosts!;

                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: hosts.length,
                  itemBuilder: (context, index) {
                    Host host = hosts[index];
                    return Card(
                      color: Colors.blueAccent,
                      elevation: 3,
                      child: ListTile(
                        title: Text(host.location.country),
                        subtitle: Text('${host.ip}:${host.port}'),
                        trailing: IconButton(
                          onPressed: () async {
                            await copyToClipboard(host.toString());
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Maglumatlar kopyalandy !'),
                                ),
                              );
                            }
                          },
                          icon: const Icon(Icons.copy, color: Colors.white),
                        ),
                      ),
                    );
                  },
                );
              },
              error: (error, stackTrace) => errorMethod(error),
              loading: () => const Center(
                child: Text(
                  'Garasmagynyzy hayys edyaris ...',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
