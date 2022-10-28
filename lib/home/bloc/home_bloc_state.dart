part of 'home_bloc_bloc.dart';

enum HomeBlocStatus {
  initial,
  loading,
  success,
  failure,
}

class HomeBlocState extends Equatable {
  const HomeBlocState({
    this.status = HomeBlocStatus.initial,
    this.accounts = const <Account>[],
  });

  final HomeBlocStatus status;
  final List<Account> accounts;

  HomeBlocState copyWith({
    HomeBlocStatus? status,
    List<Account>? accounts,
  }) {
    return HomeBlocState(
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
