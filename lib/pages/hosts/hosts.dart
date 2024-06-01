import 'package:acar/helpers/functions/methods/widgets.dart';
import 'package:acar/models/host.dart';
import 'package:acar/providers/models/host.dart';
import 'package:acar/providers/pages/host.dart';
import 'package:acar/services/host.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HostsPage extends ConsumerWidget {
  const HostsPage({super.key, required this.filename});

  final String filename;

  Future<void> copyToClipboard(String text) async {
    Clipboard.setData(ClipboardData(text: text));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    HostParams params = HostParams(context: context, filename: filename);
    ref.read(fetchHostsByFileNameProvider(params));
    List<Host> hosts = ref.watch(resultHostsProvider);
    bool loadHosts = ref.watch(loadHostsProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: loadHosts
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 15,
                    width: 15,
                    child: CircularProgressIndicator(
                      color: Colors.blueAccent,
                      strokeWidth: 2,
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 150,
                    child: const Text(
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      'Beyleki serverler barlanyar',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              )
            : const SizedBox(),
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
      ),
      body: (hosts == [] || hosts.isEmpty)
          ? loadMethod()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                itemCount: hosts.length,
                itemBuilder: (context, index) {
                  Host host = hosts[index];
                  return Card(
                    color: Colors.blueAccent,
                    elevation: 3,
                    child: ListTile(
                      title: Text(
                        host.location.country,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '${host.ip}:${host.port}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                        onPressed: () async {
                          await copyToClipboard(host.hostname.toString());
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                duration: Duration(seconds: 3),
                                backgroundColor: Colors.green,
                                content: Text('Maglumatlar kopýalandy !'),
                              ),
                            );
                          }
                        },
                        icon: const Icon(Icons.copy, color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
