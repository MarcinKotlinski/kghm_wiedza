import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:user_repository/src/models/models.dart';
import 'package:uuid/uuid.dart';

const AUTH0_DOMAIN =
    'dev-0wsp334h4lrgduor.us.auth0.com';

class UserRepository {
  Future<User> getUser(String? accessToken) async {
    const url = 'https://$AUTH0_DOMAIN/userinfo';
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
            Uuid().v4(),
            userData['name'].toString(),
            userData['picture'].toString()
        );
      }
      return User.empty;
    } else {
      throw Exception('Failed to get user details');
    }
  }
}
