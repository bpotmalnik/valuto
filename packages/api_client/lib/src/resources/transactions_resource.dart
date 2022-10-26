import 'dart:convert';

import 'package:api_models/api_models.dart';
import 'package:http/http.dart' as http;

/// Exception thrown when there was a problem with getTransactions request
class GetTransactionsRequestFailure implements Exception {}

/// Exception thrown when there was a problem with getTransactions mapping
class GetTransactionsSerializationFailure implements Exception {} 

/// {@template transactions_resource}
/// API Resource for [Transaction]
/// {@endtemplate}
class TransactionsResource { 
  /// {@macro transactions_resource} 
  TransactionsResource({http.Client? httpClient})
          : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'valuto-api.test';

  final http.Client _httpClient;
  
  /// Fetch list of [Transaction] from api
  Future<List<Transaction>> getTransactions() async {
    final response = await _httpClient.get(
        Uri.https(_baseUrl, 'api/transactions'),
    );

    if(response.statusCode != 200){
        throw GetTransactionsRequestFailure();
    }

    try {
        final transactionJson = jsonDecode(response.body) as List<dynamic>;

        return transactionJson.map((transaction) {
            return Transaction.fromJson(transaction as Map<String,dynamic>);
        }).toList();
    } catch (_) {
        throw GetTransactionsRequestFailure();
    }
  }
}
