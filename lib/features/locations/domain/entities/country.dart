import 'package:equatable/equatable.dart';

class Country extends Equatable {
  final String id;
  final String value;

  const Country({required this.id, required this.value});

  @override
  List<Object?> get props => [id, value];

  @override
  bool? get stringify => false;
}
