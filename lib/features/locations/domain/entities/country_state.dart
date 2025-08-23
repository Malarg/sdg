import 'package:equatable/equatable.dart';

class CountryState extends Equatable {
  final String id;
  final String value;
  final String countryId;

  const CountryState({
    required this.id,
    required this.value,
    required this.countryId,
  });

  @override
  List<Object?> get props => [id, value, countryId];

  @override
  bool? get stringify => false;
}
