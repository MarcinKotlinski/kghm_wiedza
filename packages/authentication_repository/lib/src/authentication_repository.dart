import 'dart:async';
import 'dart:convert';

import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final FlutterAppAuth appAuth = FlutterAppAuth();
final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

const AAD_DOMAIN =
    'origanum-227.man.poznan.pl:8082/auth/realms/SmartKampus';
const AAD_CLIENT_ID = 'bikestation_login';
const AAD_REDIRECT_URI = 'com.keycloak.keycloakauth://login-callback';
const AAD_LOGOUT_URI = 'https://$AAD_DOMAIN';
const AAD_ISSUER = 'https://$AAD_DOMAIN';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Map<String, dynamic> parseIdToken(String? idToken) {
    final parts = idToken?.split('.');
    assert(parts?.length == 3);

    return jsonDecode(
      utf8.decode(
        base64Url.decode(
          base64Url.normalize(parts![1]),
        ),
      ),
    ) as Map<String, dynamic>;
  }

  Future<void> logIn() async {
    try {
      final result = await appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          AAD_CLIENT_ID,
          AAD_REDIRECT_URI,
          clientSecret: 'xXWIsDr27uuZ0qGqhc8AvjOTLeWqmhBS',
          issuer: 'https://$AAD_DOMAIN',
          scopes: ['openid', 'profile', 'offline_access'],
          // promptValues: ['login']
        ),
      );
      // print('ID TOKEN: ${result?.idToken}');
      await secureStorage.write(
          key: 'refresh_token', value: result?.refreshToken);
      await secureStorage.write(key: 'id_token', value: result?.idToken);
      await secureStorage.write(
          key: 'access_token', value: result?.accessToken);
      _controller.add(AuthenticationStatus.authenticated);
    } catch (e, s) {
      print('login error: $e - stack: $s');
    }
  }

  Future<void> logOut() async {
    final storedIDToken = await secureStorage.read(key: 'id_token');
    try {
      await appAuth.endSession(
        EndSessionRequest(
            idTokenHint: storedIDToken,
            issuer: AAD_LOGOUT_URI,
            postLogoutRedirectUrl: AAD_REDIRECT_URI,
            allowInsecureConnections: true),
      );
    } catch (e, s) {
      print('login error: $e - stack: $s');
    }
    await secureStorage.delete(key: 'refresh_token');

    _controller.add(AuthenticationStatus.unauthenticated);
  }

  Future<void> refreshToken() async {
    final storedRefreshToken = await secureStorage.read(key: 'refresh_token');

    if (storedRefreshToken == null) return;

    try {
      final response = await appAuth.token(TokenRequest(
        AAD_CLIENT_ID,
        AAD_REDIRECT_URI,
        clientSecret: 'xXWIsDr27uuZ0qGqhc8AvjOTLeWqmhBS',
        issuer: 'https://$AAD_DOMAIN',
        scopes: ['openid', 'profile', 'offline_access'],
      ));

      // print('ID TOKEN: ${result?.idToken}');
      await secureStorage.write(
          key: 'refresh_token', value: response?.refreshToken);

      _controller.add(AuthenticationStatus.authenticated);
    } on Exception catch (e, s) {
      print('error on refresh token: $e - stack: $s');
      await logOut();
    }
  }

  void dispose() => _controller.close();
}
