import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_player/app/features/authentication/services/auth_service.dart';
import 'package:music_player/app/features/authentication/state/auth_result.dart';
import 'package:music_player/app/features/authentication/state/auth_state.dart';
import 'package:music_player/core/network/models/app_response_model.dart';
import 'package:music_player/main.dart';
import 'package:music_player/utils/local_storage/storage_service.dart';

// * Provides currently logged in userid (nullable string)
final userIdProvider = Provider<String?>((ref) {
  return ref.watch(authStateProvider).result?.userId;
});

// * Provides currently logged in status (boolean)
final isLoggedInProvider = Provider<bool>((ref) {
  final authState = ref.watch(authStateProvider);
  return authState.result?.result == AuthResult.success;
});

// * Provides current AuthResult
final authResultStateProvider = Provider<AuthResult?>((ref) {
  return ref.watch(authStateProvider).result?.result;
});

// * ----------------------------------------------------------------

final authStateProvider =
    StateNotifierProvider<AuthStateNotifier, AppResponse<AuthState>>((ref) {
  return AuthStateNotifier();
});

class AuthStateNotifier extends StateNotifier<AppResponse<AuthState>> {
  final _authService = AuthService();

  AuthStateNotifier() : super(const AppResponse(result: AuthState.unknown())) {
    if (_authService.isAlreadyloggedIn && StorageService.getIsLoggedIn()) {
      state = AppResponse(
        result: AuthState(
          result: AuthResult.success,
          userId: _authService.userId,
        ),
      );
    }
  }

  Future<void> register({
    required String email,
    required String password,
  }) async {
    state = state.copyWith(result: const AuthState.unknown(), isLoading: true);
    final result =
        await _authService.register(email: email, password: password);
    await setValuesinLocalStorage();
    state = state.copyWith(
      result: AuthState(result: result, userId: _authService.userId),
      isLoading: false,
    );
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = state.showLoading(true);
    final result = await _authService.login(email: email, password: password);
    await setValuesinLocalStorage();
    state = state.copyWith(
      result: AuthState(result: result, userId: _authService.userId),
      isLoading: false,
    );
  }

  // * Logout
  Future<void> logOut() async {
    state = state.showLoading(true);
    await _authService.logout();
    await prefs.clear();
    state = state.copyWith(
      result: const AuthState.unknown(),
      isLoading: false,
    );
  }

  // * Set Values to Local storage
  Future<void> setValuesinLocalStorage() async {
    StorageService.setIsLoggedIn(true);
    StorageService.setUserId(_authService.userId ?? '');
  }
}
