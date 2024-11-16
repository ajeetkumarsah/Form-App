abstract class UpdateState {}

class UpdateInitialState extends UpdateState {}

class UpdateInProgressState extends UpdateState {}

class UpdateSuccessState extends UpdateState {}

class UpdateFailureState extends UpdateState {
  final String error;

  UpdateFailureState(this.error);
}
