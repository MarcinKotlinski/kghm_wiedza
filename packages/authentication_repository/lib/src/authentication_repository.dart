import 'dart:async';
import 'dart:convert';

import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final FlutterAppAuth appAuth = FlutterAppAuth();
final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

const AUTH0_DOMAIN = 'dev-0wsp334h4lrgduor.us.auth0.com';
const AUTH0_CLIENT_ID = 'KnMLmZiJgc5Us54ADC70tOtl07E72IfW';
const AUTH0_REDIRECT_URI = 'com.kghm.wiedza://login-callback';
const AUTH0_LOGOUT_URI = 'https://$AUTH0_DOMAIN';
const AUTH0_ISSUER = 'https://$AUTH0_DOMAIN';

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
          AUTH0_CLIENT_ID,
          AUTH0_REDIRECT_URI,
          clientSecret: '9NgZF2E9Co9_FappiNPh0M6Cmxpq4KlIbXUpEWM5pfWwebpq5CJPgzt4fhP0XHEf',
          issuer: 'https://$AUTH0_DOMAIN',
          scopes: ['openid', 'profile', 'offline_access'],
          promptValues: ['login']
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
    await secureStorage.delete(key: 'refresh_token');

    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
