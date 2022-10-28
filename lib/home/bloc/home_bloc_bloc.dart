import 'package:accounts_repository/accounts_repository.dart';
import 'package:api_models/api_models.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBloc({required AccountsRepository accountsRepository})
      : _accountsRepository = accountsRepository,
        super(const HomeBlocState()) {
    on<HomeDataRequested>(_getAccounts);
  }

  final AccountsRepository _accountsRepository;

  Future<void> _getAccounts(
    HomeDataRequested event,
    Emitter<dynamic> emit,
  ) async {
    emit(
      state.copyWith(status: HomeBlocStatus.loading),
    );

    try {
      final accounts = await _accountsRepository.getAccounts();

      emit(
        state.copyWith(
          status: HomeBlocStatus.success,
          accounts: accounts,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: HomeBlocStatus.failure,
        ),
      );
    }
  }
}
