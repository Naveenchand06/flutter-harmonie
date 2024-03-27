import 'package:flutter/foundation.dart';
import 'package:music_player/app/features/authentication/state/auth_result.dart';

@immutable
class AuthState {
  final AuthResult? result;
  final String? userId;

  const AuthState({
    required this.result,
    required this.userId,
  });

  const AuthState.unknown()
      : result = null,
        userId = null;

  AuthState copiedWithIsLoading(bool isLoading) => AuthState(
        result: result,
        userId: userId,
      );

  AuthState copyWith({
    AuthResult? result,
    bool? isLoading,
    String? userId,
  }) =>
      AuthState(
        result: result ?? this.result,
        userId: userId ?? this.userId,
      );

  @override
  bool operator ==(covariant AuthState other) =>
      identical(this, other) ||
      (result == other.result && userId == other.userId);

  @override
  int get hashCode => Object.hash(
        result,
        userId,
      );
}
