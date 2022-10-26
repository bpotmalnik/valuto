import 'package:accounts_repository/accounts_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:transactions_repository/transactions_repository.dart';
import 'package:valuto/home/view/home_page.dart';
import 'package:valuto/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({
    required AccountsRepository accountsRepository,
    required TransactionsRepository transactionsRepository,
    super.key,
  }) : _accountsRepository = accountsRepository,
    _transactionsRepository = transactionsRepository;

  final AccountsRepository _accountsRepository;
  final TransactionsRepository _transactionsRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
         RepositoryProvider.value(value: _accountsRepository),
         RepositoryProvider.value(value: _transactionsRepository),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(242, 241, 246, 1),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const HomePage(),
    );
  }
}
