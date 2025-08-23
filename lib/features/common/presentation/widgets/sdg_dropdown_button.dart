import 'package:flutter/material.dart';
import 'package:sdg/features/common/presentation/mixins/sdg_dropdown_item_mixin.dart';
import 'package:sdg/features/common/presentation/sdg_state.dart';

enum SdgDropdownState {
  inactive,
  active,
  loading,
  error;

  static SdgDropdownState fromSdgState(SdgState state) {
    return switch (state) {
      SdgStateInitial() => SdgDropdownState.inactive,
      SdgStateLoading() => SdgDropdownState.loading,
      SdgStateError() => SdgDropdownState.error,
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

  const SdgDropdownButton({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onItemSelected,
    required this.state,
    required this.onErrorButtonPressed,
    required this.errorButtonText,
  });

  @override
  Widget build(BuildContext context) {
    return switch (state) {
      SdgDropdownState.active || SdgDropdownState.inactive => DropdownButton<T>(
        value: state == SdgDropdownState.active ? selectedItem : null,
        items: state == SdgDropdownState.active ? _buildItems() : null,
        onChanged: onItemSelected,
        isExpanded: true,
        icon: Icon(Icons.keyboard_arrow_down),
        iconSize: 24,
        underline: Container(height: 1, color: Colors.grey),
      ),
      SdgDropdownState.loading => Center(child: CircularProgressIndicator()),
      SdgDropdownState.error => TextButton(
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
