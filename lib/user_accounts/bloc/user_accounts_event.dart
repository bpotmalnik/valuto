part of 'user_accounts_bloc.dart';

abstract class UserAccountsEvent extends Equatable {}

class UserAccountsRequested extends UserAccountsEvent {
  UserAccountsRequested();

  @override
  List<Object?> get props => [];
}
