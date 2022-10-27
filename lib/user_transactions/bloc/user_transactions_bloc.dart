import 'package:api_models/api_models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:transactions_repository/transactions_repository.dart';

part 'user_transactions_event.dart';
part 'user_transactions_state.dart';

class UserTransactionsBloc
    extends Bloc<UserTransactionsEvent, UserTransactionsState> {
  UserTransactionsBloc({
    required TransactionsRepository transactionsRepository,
  })  : _transactionsRepository = transactionsRepository,
        super(const UserTransactionsState()) {
    on<UserTransactionsRequested>(_getTransactions);
  }

  final TransactionsRepository _transactionsRepository;

  Future<void> _getTransactions(
    UserTransactionsRequested event,
    Emitter<dynamic> emit,
  ) async {
    emit(state.copyWith(status: UserTransactionsStatus.loading));

    try {
      final transactions = await _transactionsRepository.getTransactions();

      emit(
        state.copyWith(
          status: UserTransactionsStatus.success,
          transactions: transactions,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: UserTransactionsStatus.failure,
        ),
      );
    }
  }
}
