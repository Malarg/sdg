sealed class SdgState<T> {
  final T? value;

  SdgState({this.value});
}

class SdgStateInitial<T> extends SdgState<T> {
  SdgStateInitial({super.value});
}

class SdgStateLoading<T> extends SdgState<T> {
  SdgStateLoading({super.value});
}

class SdgStateIdle<T> extends SdgState<T> {
  SdgStateIdle({required super.value});
}

class SdgStateError<T> extends SdgState<T> {
  final Exception error;
  SdgStateError({required this.error, super.value});
}
