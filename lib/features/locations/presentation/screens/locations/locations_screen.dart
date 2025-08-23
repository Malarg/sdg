import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sdg/features/locations/presentation/screens/locations/locations_controller.dart';
import 'package:sdg/features/locations/presentation/screens/locations/locations_screen_state.dart';
import 'package:sdg/features/locations/presentation/widgets/country_states/select_country_state_widget.dart';
import 'package:sdg/features/locations/presentation/widgets/coutry/select_country_widget.dart';

class LocationsScreen extends ConsumerWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(LocationsController.provider, (previous, next) {
      if (next is LocationsScreenStateValidationError) {
        final text = switch (next.error) {
          LocationsScreenValidationError.noCountrySelected =>
            'Select a country first',
          LocationsScreenValidationError.noCountryStateSelected =>
            'Select a country state first',
        };
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(text)));
      }
      if (next is LocationsScreenStateValidationSuccess) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Success')));
      }
    });

    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text('Social development group')),
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
                onPressed: ref
                    .read(LocationsController.provider.notifier)
                    .continueToNextStep,
                child: Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
