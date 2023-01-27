import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:user_repository/src/models/models.dart';

const AAD_DOMAIN =
    'origanum-227.man.poznan.pl:8082/auth/realms/SmartKampus';

class UserRepository {
  Future<User> getUser(String? accessToken) async {
    const url = 'https://$AAD_DOMAIN/protocol/openid-connect/userinfo';
    final response = await http.get(
      Uri.parse(url),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $accessToken',
      },
    );
    if (response.statusCode == 200) {
      var userData = jsonDecode(response.body);
      if (userData != null) {
        return User(
            userData['sid'].toString(),
            userData['given_name'].toString(),
            userData['family_name'].toString(),
        );
      }
      return User.empty;
    } else {
      throw Exception('Failed to get user details');
    }
  }
}
