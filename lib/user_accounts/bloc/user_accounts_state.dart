part of 'user_accounts_bloc.dart';

enum UserAccountsStatus {
  initial,
  loading,
  success,
  failure,
}

class UserAccountsState extends Equatable {
  const UserAccountsState({
    this.status = UserAccountsStatus.initial,
    this.accounts = const <Account>[],
  });

  final UserAccountsStatus status;
  final List<Account> accounts;

  UserAccountsState copyWith({
    UserAccountsStatus? status,
    List<Account>? accounts,
  }) {
    return UserAccountsState(
      status: status ?? this.status,
      accounts: accounts ?? this.accounts,
    );
  }

  @override
  List<Object?> get props => [
    status,
    accounts,
  ];
}
