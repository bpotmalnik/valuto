// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      id: json['id'] as String,
      accountId: json['account_id'] as String,
      name: json['name'] as String,
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'account_id': instance.accountId,
      'name': instance.name,
      'amount': instance.amount,
    };
