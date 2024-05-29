import 'package:acar/helpers/functions/internet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var checkInternetConnProvider =
    FutureProvider.autoDispose.family<bool, BuildContext>((ref, arg) async {
  return await checkIntConn(arg);
});
