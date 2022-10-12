import 'package:flutter/material.dart';
import 'package:valuto/home/view/home_page.dart';

class UserTransactionsPage extends StatelessWidget {
  const UserTransactionsPage({super.key});

  static Route<void> route() => MaterialPageRoute<void>(
        builder: (_) => const UserTransactionsPage(),
      );

  @override
  Widget build(BuildContext context) {
    return const UserTransactionView();
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
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) {
                  final String transactionNumber = (index + 1).toString();

                  return ListTile(
                    leading: Icon(Icons.currency_pound),
                    title: Text('#$transactionNumber spending'),
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
      height: MediaQuery.of(context).size.height * 0.70,
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