import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sdg/features/locations/presentation/widgets/country_states/select_country_state_widget.dart';
import 'package:sdg/features/locations/presentation/widgets/coutry/select_country_widget.dart';

class LocationsScreen extends ConsumerWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            ],
          ),
        ),
      ),
    );
  }
}
