import 'package:api_client/api_client.dart';
import 'package:api_models/api_models.dart';

/// Exception thrown when getting accounts fails
class GetAccountsFailure implements Exception {}

/// {@template accounts_repository}
/// Accounts Repository
/// {@endtemplate}
class AccountsRepository {
  /// {@macro accounts_repository}
  AccountsRepository({
    ApiClient? apiClient,
  }): _apiClient = apiClient ?? ApiClient();

  final ApiClient _apiClient;

  /// Fetch list of [Account] from api.
  Future<List<Account>> getAccounts() async {
    try {
      return await _apiClient.accountsResource.getAccounts();
    } catch (_) {
      throw GetAccountsFailure();
    }
  }
}
