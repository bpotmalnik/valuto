import 'package:equatable/equatable.dart';

/// {@template account}
/// A class that represents a account using the app
/// {@endtemplate}
class Account extends Equatable {
  /// {@macro account}
  const Account({
    required this.id,
    required this.name,
  });

  /// The id of the account
  final String id;

  /// The name of the account
  final String name;

  @override
  List<Object> get props => [
        id,
        name,
      ];
}
