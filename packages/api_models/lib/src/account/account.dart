import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

/// {@template account}
/// A class that represents a account using the app
/// {@endtemplate}
@JsonSerializable()
class Account extends Equatable {
  /// {@macro account}
  const Account({
    required this.id,
    required this.name,
  });

  /// Constructs a [Account] from a JSON object.
  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  /// Id of the account
  @JsonKey(name: 'id')
  final String id;

  /// Name of the account
  @JsonKey(name: 'name')
  final String name;

  /// Returns a JSON object representing this [Account]
  Map<String, dynamic> toJson() => _$AccountToJson(this);

  @override
  List<Object> get props => [
        id,
        name,
      ];
}
