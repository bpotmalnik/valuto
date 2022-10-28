import 'package:api_models/api_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transactions_repository/transactions_repository.dart';
import 'package:valuto/home/view/home_page.dart';
import 'package:valuto/user_transactions/user_transactions.dart';

class UserTransactionsPage extends StatelessWidget {
  const UserTransactionsPage({super.key});

  static Route<void> route() => MaterialPageRoute<void>(
        builder: (_) => const UserTransactionsPage(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserTransactionsBloc(
        transactionsRepository: context.read<TransactionsRepository>(),
      )..add(UserTransactionsRequested()),
      child: const UserTransactionView(),
    );
  }
}

class UserTransactionView extends StatelessWidget {
  const UserTransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Transaction',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Card(
              child: BlocBuilder<UserTransactionsBloc, UserTransactionsState>(
                builder: (context, state) {
                  if (state.transactions.isEmpty) {
                    if (state.status == UserTransactionsStatus.loading) {
                      return const LoadingAccountsList();
                    } else {
                      return const Text('No transactions available');
                    }
                  }

                  return ListView.builder(
                    itemBuilder: (BuildContext context, index) {
                      return TransactionTile(
                        transaction: state.transactions[index],
                      );
                    },
                    itemCount: state.transactions.length,
                    shrinkWrap: true,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Overview',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.traffic),
            label: 'Transactions',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.of(context)
                  .pushReplacement<void, void>(HomePage.route());
              break;
            case 1:
              Navigator.of(context)
                  .pushReplacement<void, void>(UserTransactionsPage.route());
              break;
          }
        },
      ),
    );
  }
}

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    super.key,
    required this.transaction,
  });

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(transaction.name),
      subtitle: Text(
        transaction.account.name,
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.68,
      width: double.infinity,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.width * 0.05,
      ),
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: child,
    );
  }
}
