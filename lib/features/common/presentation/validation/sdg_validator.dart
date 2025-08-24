import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sdg/features/common/presentation/validation/sdg_validation_state.dart';

abstract class SdgValidator<T, E>
    extends AutoDisposeNotifier<SdgValidationState<E>> {
  @override
  SdgValidationState<E> build() {
    return SdgValidationStateIdle();
  }

  List<E? Function(T?)> getValidators();

  void validate({required T? value, bool persistentError = true}) {
    state = SdgValidationStateValidating();

    final error = _getError(value);
    if (error == null) {
      state = SdgValidationStateSuccess();
      return;
    }

    state = SdgValidationStateError<E>(error: error);
    if (!persistentError) {
      // It make sense when it's required to show any notification (e.g. snackbar)
      state = SdgValidationStateIdle();
    }
  }

  void clearValidation() {
    state = SdgValidationStateIdle();
  }

  E? _getError(T? value) {
    final validatorsFunctions = getValidators();
    for (final func in validatorsFunctions) {
      final error = func(value);
      if (error != null) {
        return error;
      }
    }
    return null;
  }
}
