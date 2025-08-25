import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sdg/features/common/presentation/validation/sdg_validation_common_error.dart';
import 'package:sdg/features/common/presentation/validation/sdg_validation_state.dart';
import 'package:sdg/features/locations/presentation/screens/locations/location_screen_validator.dart';
import 'package:sdg/features/locations/presentation/widgets/country_states/select_country_state_widget.dart';
import 'package:sdg/features/locations/presentation/widgets/country/select_country_widget.dart';

class LocationScreen extends ConsumerWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(LocationScreenValidator.provider, (previous, next) {
      if (next is SdgValidationStateError) {
        final text = switch ((next as SdgValidationStateError).error) {
          SdgValidationCommonError.invalid => 'Fix errors first',
          _ => null,
        };
        if (text != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(text)));
        }
      }
      if (next is SdgValidationStateSuccess) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Success')));
      }
    });

    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text('Social discovery group')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Text('Select country', style: textTheme.titleMedium),
              SelectCountryWidget(),
              const SizedBox(height: 24),
              Text('Select state', style: textTheme.titleMedium),
              SelectCountryStateWidget(),
              Expanded(child: SizedBox.shrink()),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(LocationScreenValidator.provider.notifier)
                      .validate(value: null);
                },
                child: Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
