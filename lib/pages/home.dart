import 'package:acar/pages/dates/dates.dart';
import 'package:acar/pages/login/login.dart';
import 'package:acar/providers/local_storadge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String token = ref.watch(tokenProvider);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: token.isEmpty ? LoginPage() : const DatesPage(),
      ),
    );
  }
}
