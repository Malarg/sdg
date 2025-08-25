import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod/riverpod.dart';
import 'package:sdg/features/common/presentation/validation/sdg_validation_state.dart';
import 'package:sdg/features/locations/di/locations_providers.dart';
import 'package:sdg/features/locations/domain/entities/country.dart';
import 'package:sdg/features/locations/domain/entities/country_state.dart';
import 'package:sdg/features/locations/presentation/screens/locations/location_screen_validator.dart';
import 'package:sdg/features/locations/presentation/widgets/country/selected_country_controller.dart';
import 'package:sdg/features/locations/presentation/widgets/country_states/selected_country_state_controller.dart';
import 'package:sdg/features/locations/presentation/widgets/country_states/selected_country_state_validator.dart';

import '../../../data/repositories/mock_locations_repository.dart';


void main() {
  late ProviderContainer container;
  late SelectedCountryController selectedCountryController;
  late SelectedCountryStateController selectedCountryStateController;
  late LocationScreenValidator validator;
  final country1 = Country(id: '1', value: 'USA');
  final country2 = Country(id: '2', value: 'Canada');
  final countryState1 = CountryState(
    id: '1',
    value: 'California',
    countryId: '1',
  );
  final countryState2 = CountryState(id: '2', value: 'Ontario', countryId: '1');
  setUp(() {
    container = ProviderContainer(
      overrides: [
        LocationsProviders.repositoryProvider.overrideWith(
          (ref) => MockLocationsRepository(),
        ),
      ],
    );
    selectedCountryController = container.read(
      SelectedCountryController.provider.notifier,
    );
    selectedCountryStateController = container.read(
      SelectedCountryStateController.provider.notifier,
    );
    validator = container.read(LocationScreenValidator.provider.notifier);
  });
  group('LocationScreenValidator', () {
    test("returns success when both country and state is selected", () {
      selectedCountryController.selectCountry(country1);
      selectedCountryStateController.selectCountryState(countryState1);

      validator.validate(value: null);

      final validatorState = container.read(LocationScreenValidator.provider);
      expect(validatorState, isA<SdgValidationStateSuccess>());
    });

    test("failures when nothing is selected", () {
      validator.validate(value: null);

      final validatorState = container.read(LocationScreenValidator.provider);
      expect(validatorState, isA<SdgValidationStateError>());

      final countryStateValidator = container.read(
        SelectedCountryStateValidator.provider,
      );
      expect(countryStateValidator, isA<SdgValidationStateError>());
      final error = countryStateValidator.error;
      expect(error, SelectedCountryStateValidationError.countryNotSelected);
    });

    test("failures when country state is not selected", () {
      selectedCountryController.selectCountry(country1);

      validator.validate(value: null);

      final validatorState = container.read(LocationScreenValidator.provider);
      expect(validatorState, isA<SdgValidationStateError>());
    });

    test(
      "failures when country selection changed after country state selected",
      () {
        selectedCountryController.selectCountry(country1);
        selectedCountryStateController.selectCountryState(countryState1);
        selectedCountryController.selectCountry(country2);

        validator.validate(value: null);

        final validatorState = container.read(LocationScreenValidator.provider);
        expect(validatorState, isA<SdgValidationStateError>());
      },
    );

    test(
      "success when country selection changed and state selected after country state selected",
      () {
        selectedCountryController.selectCountry(country1);
        selectedCountryStateController.selectCountryState(countryState1);
        selectedCountryController.selectCountry(country2);
        selectedCountryStateController.selectCountryState(countryState2);

        validator.validate(value: null);

        final validatorState = container.read(LocationScreenValidator.provider);
        expect(validatorState, isA<SdgValidationStateSuccess>());
      },
    );

    test("success when country selection changed and then state selected", () {
      selectedCountryController.selectCountry(country1);
      selectedCountryController.selectCountry(country2);
      selectedCountryStateController.selectCountryState(countryState1);

      validator.validate(value: null);

      final validatorState = container.read(LocationScreenValidator.provider);
      expect(validatorState, isA<SdgValidationStateSuccess>());
    });

    test("success when country state selection changed", () {
      selectedCountryController.selectCountry(country1);
      selectedCountryStateController.selectCountryState(countryState1);
      selectedCountryStateController.selectCountryState(countryState2);

      validator.validate(value: null);

      final validatorState = container.read(LocationScreenValidator.provider);
      expect(validatorState, isA<SdgValidationStateSuccess>());
    });
  });
}
