import '../../../../api/locations/dto/country_state_dto.dart';
import '../../domain/entities/country_state.dart';

class CountryStateMapper {
  /// Converts a [CountryState] domain entity to a [CountryStateDto] data transfer object
  static CountryStateDto toDto(CountryState countryState) {
    return CountryStateDto(
      value: countryState.value,
      id: countryState.id,
      countryId: countryState.countryId,
    );
  }

  /// Converts a [CountryStateDto] data transfer object to a [CountryState] domain entity
  static CountryState fromDto(CountryStateDto dto) {
    return CountryState(
      value: dto.value,
      id: dto.id,
      countryId: dto.countryId,
    );
  }
}
