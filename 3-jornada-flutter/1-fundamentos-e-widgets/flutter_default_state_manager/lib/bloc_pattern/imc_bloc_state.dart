class ImcBlocState {
  final double imc;

  ImcBlocState({
    required this.imc,
  });
}

class ImcBlocStateLoading extends ImcBlocState {
  ImcBlocStateLoading() : super(imc: 0.0);
}

class ImcBlocStateError extends ImcBlocState {
  String message;
  ImcBlocStateError({
    required this.message, required super.imc,
  });
}
