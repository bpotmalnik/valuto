import 'package:api_client/api_client.dart';
import 'package:api_models/api_models.dart';

/// Exception thrown when getting transactions fails
class GetTransactionsFailure implements Exception {}

/// {@template transaction_repository}
/// Transactions Repository
/// {@endtemplate}
class TransactionsRepository {
  /// {@macro transactions_repository}
  TransactionsRepository({
    ApiClient? apiClient,
  }): _apiClient = apiClient ?? ApiClient();

  final ApiClient _apiClient;

  /// Fetch list of [Transaction] from api.
  Future<List<Transaction>> getTransactions() async {
    try {
      return await _apiClient.transactionsResource.getTransactions();
    } catch (_) {
      throw GetTransactionsFailure();
    }
  }
}
