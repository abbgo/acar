import 'package:acar/models/token.dart';
import 'package:acar/services/token.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tokenApiProvider = Provider<TokenApiService>((ref) => TokenApiService());

var fetchTokenProvider = FutureProvider.family<ResultToken, TokenParams>(
  (ref, params) async {
    ResultToken result = ResultToken.defaultResult();

    try {
      Token token = await ref.read(tokenApiProvider).fetchToken(params);
      result = ResultToken(error: '', token: token);
    } catch (e) {
      result = ResultToken(error: e.toString());
    }
    return result;
  },
);
