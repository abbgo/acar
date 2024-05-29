import 'package:equatable/equatable.dart';

class ResultToken extends Equatable {
  final Token? token;
  final String error;

  const ResultToken({this.token, required this.error});

  factory ResultToken.defaultResult() {
    return const ResultToken(token: null, error: '');
  }

  @override
  List<Object?> get props => [token, error];
}

class Token {
  final String? token;
  final String msg;

  const Token({this.token, required this.msg});

  factory Token.defaultResult() {
    return const Token(token: null, msg: '');
  }
}
