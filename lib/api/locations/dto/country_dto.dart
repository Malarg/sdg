import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_dto.freezed.dart';
part 'country_dto.g.dart';

@Freezed(fromJson: true, toJson: false, copyWith: false)
abstract class CountryDto with _$CountryDto {
  const factory CountryDto({required String value, required String id}) =
      _CountryDto;

  factory CountryDto.fromJson(Map<String, dynamic> json) =>
      _$CountryDtoFromJson(json);
}
