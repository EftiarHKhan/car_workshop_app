import 'package:dio/dio.dart';

import '/app/session_manager/session_manager.dart';
import '/flavors/build_config.dart';
import 'client/rest_client.dart';

class Services {
  factory Services() {
    return instance;
  }
  //make a singleton class
  Services._privateConstructor();
  static final Services instance = Services._privateConstructor();

  final pref = SessionManager();
  final dio = RestClient(
    baseUrl: BuildConfig.instance.config.baseUrl,
    token: 'nothing',
  );

  Future<Map<String, dynamic>> _buildHeader() async {
    return {
      'X-API-KEY': '',
      'X-API-VALUE': '',
      'X-API-SECRET': await pref.getLoggedUserName(),
    };
  }

  Future<bool> validateResponse(Response<dynamic> response) async {
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
