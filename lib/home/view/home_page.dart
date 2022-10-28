import 'package:accounts_repository/accounts_repository.dart';
import 'package:api_models/api_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valuto/home/home.dart';
import 'package:valuto/user_accounts/user_accounts.dart';
import 'package:valuto/user_transactions/user_transactions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Route<void> route() => MaterialPageRoute<void>(
        builder: (_) => const HomePage(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        accountsRepository: context.read<AccountsRepository>(),
      )..add(HomeDataRequested()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: () {},
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Overview',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            AccountsCard(),
            GoalsCard(),
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
              Navigator.of(context).push(UserTransactionsPage.route());
              break;
          }
        },
      ),
    );
  }
}

@visibleForTesting
class AccountsCard extends StatelessWidget {
  const AccountsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Accounts',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                child: const Text(
                  'View all',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(UserAccountsPage.route());
                },
              ),
            ],
          ),
          BlocBuilder<HomeBloc, HomeBlocState>(
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
                itemCount: 3,
                shrinkWrap: true,
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                onPressed: () {},
                child: const Text('Add Account'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

@visibleForTesting
class AccountTile extends StatelessWidget {
  const AccountTile({
    required this.account,
    super.key,
  });

  final Account account;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 1,
                  horizontal: 8,
                ),
                decoration: const BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: const Icon(
                  Icons.account_balance_wallet,
                  color: Colors.white,
                  size: 40,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  account.name,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Text(
            '£${account.balance}',
            style: const TextStyle(fontSize: 17),
          ),
        ],
      ),
    );
  }
}

@visibleForTesting
class GoalsCard extends StatelessWidget {
  const GoalsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Smart Goals',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 20),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      '1 goal'.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                      ),
                    ),
                    const Text(
                      'In progress',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
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
