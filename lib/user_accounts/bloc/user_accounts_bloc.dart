import 'package:accounts_repository/accounts_repository.dart';
import 'package:api_models/api_models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_accounts_event.dart';
part 'user_accounts_state.dart';

class UserAccountsBloc extends Bloc<UserAccountsEvent, UserAccountsState> {
  UserAccountsBloc({
    required AccountsRepository accountsRepository,
  })  : _accountsRepository = accountsRepository,
        super(const UserAccountsState()) {
    on<UserAccountsRequested>(_getAccounts);
  }

  final AccountsRepository _accountsRepository;

  Future<void> _getAccounts(
    UserAccountsRequested event,
    Emitter<dynamic> emit,
  ) async {
    emit(state.copyWith(status: UserAccountsStatus.loading));

    try {
      final accounts = await _accountsRepository.getAccounts();

      emit(
        state.copyWith(
          status: UserAccountsStatus.success,
          accounts: accounts,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: UserAccountsStatus.failure,
        ),
      );
    }
  }
}
