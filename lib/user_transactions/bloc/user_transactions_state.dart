part of 'user_transactions_bloc.dart';

enum UserTransactionsStatus {
  initial,
  loading,
  success,
  failure,
}

class UserTransactionsState extends Equatable {
  const UserTransactionsState({
    this.status = UserTransactionsStatus.initial,
    this.transactions = const <Transaction>[],
  });

  final UserTransactionsStatus status;
  final List<Transaction> transactions;

  UserTransactionsState copyWith({
    UserTransactionsStatus? status,
    List<Transaction>? transactions,
  }) {
    return UserTransactionsState(
      status: status ?? this.status,
      transactions: transactions ?? this.transactions,
    );
  }

  @override
  List<Object?> get props => [
    status,
    transactions,
  ];
}