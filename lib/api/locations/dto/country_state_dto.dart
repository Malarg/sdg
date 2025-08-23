import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_state_dto.freezed.dart';
part 'country_state_dto.g.dart';

@Freezed(fromJson: true, toJson: false, copyWith: false)
abstract class CountryStateDto with _$CountryStateDto {
  const factory CountryStateDto({
    required String value,
    required String id,
    required String countryId,
  }) = _CountryStateDto;

  factory CountryStateDto.fromJson(Map<String, dynamic> json) =>
      _$CountryStateDtoFromJson(json);
}
