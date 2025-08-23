import 'package:flutter/material.dart';
import 'package:sdg/features/common/presentation/mixins/sdg_dropdown_item_mixin.dart';

enum SdgDropdownState { inactive, active, loading, error }

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
      ),
      SdgDropdownState.loading => CircularProgressIndicator(),
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
            child: Text(item.dropdownItemText),
          ),
        )
        .toList();
  }
}
