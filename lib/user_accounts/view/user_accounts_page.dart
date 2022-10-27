import 'package:accounts_repository/accounts_repository.dart';
import 'package:api_models/api_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valuto/home/view/home_page.dart';
import 'package:valuto/user_accounts/user_accounts.dart';

class UserAccountsPage extends StatelessWidget {
  const UserAccountsPage({super.key});

  static Route<void> route() => MaterialPageRoute<void>(
        builder: (_) => const UserAccountsPage(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserAccountsBloc(
        accountsRepository: context.read<AccountsRepository>(),
      )..add(UserAccountsRequested()),
      child: const UserAccountsView(),
    );
  }
}

class UserAccountsView extends StatelessWidget {
  const UserAccountsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
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
              'Accounts',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Card(
              child: BlocBuilder<UserAccountsBloc, UserAccountsState>(
                builder: (context, state) {
                  if (state.accounts.isEmpty) {
                    if (state.status == UserAccountsStatus.loading) {
                      return const LoadingAccountsList();
                    } else {
                      return const Text('No accounts available');
                    }
                  }
                  return ListView.builder(
                    itemBuilder: (BuildContext context, index) {
                      return AccountTile(account: state.accounts[index]);
                    },
                    itemCount: state.accounts.length,
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
              Navigator.of(context).push(HomePage.route());
              break;
            case 1:
              Navigator.of(context).push(UserAccountsPage.route());
              break;
          }
        },
      ),
    );
  }
}

class AccountTile extends StatelessWidget {
  const AccountTile({
    super.key,
    required this.account,
  });

  final Account account;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(account.name),
      trailing: Text('£${account.balance}'),
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

class LoadingAccountsList extends StatelessWidget {
  const LoadingAccountsList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }
}
