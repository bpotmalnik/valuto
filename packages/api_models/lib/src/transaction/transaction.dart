import 'package:api_models/api_models.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

/// {@template transaction}
/// A class that represents a transaction
/// {@endtemplate}
@JsonSerializable()
class Transaction extends Equatable {
  /// {@macro transaction}
  const Transaction({
    required this.id,
    required this.accountId,
    required this.name,
    required this.amount,
    required this.account,
  });

  /// Constructs a [Transaction] from a JSON object.
  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  /// Id of the transaction
  @JsonKey(name: 'id')
  final String id;

  /// Id of account that owns the transaction
  @JsonKey(name: 'account_id')
  final String accountId;

  /// Name of the transaction
  @JsonKey(name: 'name')
  final String name;

  /// Amount spend on the transaction
  @JsonKey(name: 'amount')
  final double amount;

  /// Account associated with the transaction
  @JsonKey(name: 'account')
  final Account account;
  @override
  List<Object> get props => [
        id,
        accountId,
        name,
        amount,
        account,
      ];
}
