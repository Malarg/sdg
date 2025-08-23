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
      SdgDropdownState.active => DropdownButton<T>(
        value: selectedItem,
        items: _buildItems(),
        onChanged: onItemSelected,
        isExpanded: true,
        icon: Icon(Icons.keyboard_arrow_down),
        iconSize: 24,
        underline: Container(height: 1, color: Colors.grey),
      ),
      SdgDropdownState.inactive => _InactiveDropdown(),
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

/// This is required, because default dropdown looks ugly when it's inactive.
class _InactiveDropdown extends StatelessWidget {
  const _InactiveDropdown();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade400, width: 1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: SizedBox.shrink()),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey.shade400,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
