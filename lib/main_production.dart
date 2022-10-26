import 'package:accounts_repository/accounts_repository.dart';
import 'package:api_client/api_client.dart';
import 'package:transactions_repository/transactions_repository.dart';
import 'package:valuto/app/app.dart';
import 'package:valuto/bootstrap.dart';

void main() {
  final apiClient = ApiClient();

  final accountsRepository = AccountsRepository(
    apiClient: apiClient,
  );

  final transactionsRepository = TransactionsRepository(
    apiClient: apiClient,
  );

  bootstrap(
    () => App(
      accountsRepository: accountsRepository,
      transactionsRepository: transactionsRepository,
    ),
  );
}
