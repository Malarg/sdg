import 'package:flutter/material.dart';
import 'package:sdg/features/common/presentation/mixins/sdg_dropdown_item_mixin.dart';
import 'package:sdg/features/common/presentation/sdg_state.dart';

enum SdgDropdownState {
  inactive,
  active,
  loading,
  hasNotValues;

  static SdgDropdownState fromSdgState(SdgState state) {
    return switch (state) {
      SdgStateInitial() => SdgDropdownState.inactive,
      SdgStateLoading() => SdgDropdownState.loading,
      SdgStateError() => SdgDropdownState.hasNotValues,
      SdgStateIdle() => SdgDropdownState.active,
    };
  }
}

class SdgDropdownButton<T extends SdgDropdownItemMixin>
    extends StatelessWidget {
  final List<T>? items;
  final T? selectedItem;
  final ValueChanged<T?>? onItemSelected;
  final VoidCallback onErrorButtonPressed;
  final String errorButtonText;
  final SdgDropdownState state;
  final String? errorText;

  const SdgDropdownButton({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onItemSelected,
    required this.state,
    required this.onErrorButtonPressed,
    required this.errorButtonText,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return switch (state) {
      SdgDropdownState.active || SdgDropdownState.inactive => DropdownButtonFormField<T>(
        initialValue: state == SdgDropdownState.active ? selectedItem : null,
        items: state == SdgDropdownState.active ? _buildItems() : null,
        onChanged: onItemSelected,
        isExpanded: true,
        icon: Icon(Icons.keyboard_arrow_down),
        iconSize: 24,
        forceErrorText: errorText,
      ),
      SdgDropdownState.loading => Center(child: CircularProgressIndicator()),
      SdgDropdownState.hasNotValues => TextButton(
        onPressed: onErrorButtonPressed,
        child: Text(errorButtonText),
      ),
    };
  }

  List<DropdownMenuItem<T>>? _buildItems() {
    return items
        ?.map(
          (item) => DropdownMenuItem<T>(
            value: item,
            child: Text(item.dropdownItemText, overflow: TextOverflow.ellipsis),
          ),
        )
        .toList();
  }
}
