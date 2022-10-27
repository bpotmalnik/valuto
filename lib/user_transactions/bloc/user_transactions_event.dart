part of 'user_transactions_bloc.dart';

abstract class UserTransactionsEvent extends Equatable {}

class UserTransactionsRequested extends UserTransactionsEvent{
  UserTransactionsRequested();
  
  @override
  List<Object?> get props => [];
}
