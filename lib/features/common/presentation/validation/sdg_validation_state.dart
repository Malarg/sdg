sealed class SdgValidationState<T> {
  const SdgValidationState();

  T? get error => switch (this) {
    SdgValidationStateError(:final error) => error,
    _ => null,
  };

  bool get isValid => this is SdgValidationStateSuccess;
  bool get isError => this is SdgValidationStateError;
  bool get isIdle => this is SdgValidationStateIdle;
  bool get isValidating => this is SdgValidationStateValidating;
}

class SdgValidationStateIdle<T> extends SdgValidationState<T> {
  const SdgValidationStateIdle();
}

class SdgValidationStateValidating<T> extends SdgValidationState<T> {
  const SdgValidationStateValidating();
}

class SdgValidationStateSuccess<T> extends SdgValidationState<T> {
  const SdgValidationStateSuccess();
}

class SdgValidationStateError<T> extends SdgValidationState<T> {
  @override
  final T error;

  const SdgValidationStateError({required this.error});
}
