import 'dart:convert';

import 'package:api_models/api_models.dart';
import 'package:http/http.dart' as http;

/// Exception thrown when there was a problem with getAccounts request
class GetAccountsRequestFailure implements Exception {}

/// Exception thrown when there was a problem with mapping
class GetAccountsSerializationFailure implements Exception {}

/// {@template accounts_resource}
/// API Resource for [Account]
/// {@endtemplate}
class AccountsResource {
  /// {@macro accounts_resource}
  AccountsResource({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'valuto-api.test:82';

  final http.Client _httpClient;

  /// Fetch list of [Account] from api
  Future<List<Account>> getAccounts() async {
    final response = await _httpClient.get(
      Uri.http(_baseUrl, 'api/accounts'),
    );

    if (response.statusCode != 200) {
      throw GetAccountsRequestFailure();
    }

    try {
      final accountsJson = jsonDecode(response.body) as Map<String, dynamic>;
      final accounts = accountsJson['data'] as List<dynamic>;

      return accounts.map((account) {
        return Account.fromJson(account as Map<String, dynamic>);
      }).toList();
    } catch (_) {
      throw GetAccountsSerializationFailure();
    }
  }
}
