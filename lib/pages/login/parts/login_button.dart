import 'package:acar/helpers/functions/device_id.dart';
import 'package:acar/helpers/functions/snackbars.dart';
import 'package:acar/helpers/static_data.dart';
import 'package:acar/models/token.dart';
import 'package:acar/providers/internet.dart';
import 'package:acar/providers/local_storadge.dart';
import 'package:acar/providers/models/token.dart';
import 'package:acar/services/token.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({super.key, required this.codeCtrl});

  final TextEditingController codeCtrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: elevatedButtonColor),
      onPressed: () async {
        bool hasInternet = true;

        String deviceID = await getDeviceId();

        if (codeCtrl.text.isEmpty || codeCtrl.text == '') return;

        if (context.mounted) {
          hasInternet =
              await ref.read(checkInternetConnProvider(context).future);
        }

        if (hasInternet) {
          TokenParams params =
              TokenParams(code: codeCtrl.text, deviceID: deviceID);

          ResultToken resultToken =
              await ref.watch(fetchProductProvider(params).future);

          if (resultToken.token!.token != null) {
            ref.read(tokenProvider.notifier).update(resultToken.token!.token!);
            return;
          }

          if (context.mounted) showSomeErr(context, resultToken.error);
        }
      },
      child: const Text('Login', style: TextStyle(color: Colors.white)),
    );
  }
}
