part of 'home_bloc_bloc.dart';

abstract class HomeBlocEvent extends Equatable {}

class HomeDataRequested extends HomeBlocEvent {
  HomeDataRequested();

  @override
  List<Object> get props => [];
}
