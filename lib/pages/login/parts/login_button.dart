import 'package:acar/helpers/functions/device_id.dart';
import 'package:acar/helpers/functions/snackbars.dart';
import 'package:acar/helpers/static_data.dart';
import 'package:acar/models/token.dart';
import 'package:acar/providers/internet.dart';
import 'package:acar/providers/local_storadge.dart';
import 'package:acar/providers/models/token.dart';
import 'package:acar/providers/pages/login.dart';
import 'package:acar/services/token.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginButton extends ConsumerWidget {
  const LoginButton({super.key, required this.codeCtrl});

  final TextEditingController codeCtrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String oldUUID = ref.watch(uuidProvider);
    bool loadLogin = ref.watch(loadLoginProvider);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: elevatedButtonColor),
      onPressed: () async {
        FocusScope.of(context).unfocus();
        ref.read(loadLoginProvider.notifier).state = true;
        bool hasInternet = false;
        String uuid = '';

        if (oldUUID != '') {
          uuid = oldUUID;
        } else {
          uuid = await generateUUID();
          await ref.read(uuidProvider.notifier).update(uuid);
        }

        if (codeCtrl.text.isEmpty || codeCtrl.text == '') {
          if (context.mounted) showSomeErr(context, 'Login nomeriňizi ýazyň !');
          ref.read(loadLoginProvider.notifier).state = false;
          return;
        }

        if (context.mounted) {
          hasInternet =
              await ref.read(checkInternetConnProvider(context).future);
        }

        if (hasInternet) {
          TokenParams params = TokenParams(code: codeCtrl.text, deviceID: uuid);

          ResultToken resultToken =
              await ref.watch(fetchTokenProvider(params).future);

          if (resultToken.token != null) {
            ref.read(tokenProvider.notifier).update(resultToken.token!.token!);
            ref.read(loadLoginProvider.notifier).state = false;
            return;
          }

          if (context.mounted) showSomeErr(context, resultToken.error);
          ref.read(loadLoginProvider.notifier).state = false;
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Login', style: TextStyle(color: Colors.white)),
          const SizedBox(width: 10),
          if (loadLogin)
            const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(color: Colors.white),
            )
          else
            const SizedBox(),
        ],
      ),
    );
  }
}
