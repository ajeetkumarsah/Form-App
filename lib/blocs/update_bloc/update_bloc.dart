import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_app/data/repositories/user_repository.dart';
import 'update_event.dart';
import 'update_state.dart';

class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  final UserRepository userRepository;

  UpdateBloc(this.userRepository) : super(UpdateInitialState()) {
    on<SubmitUpdateEvent>((event, emit) async {
      emit(UpdateInProgressState());
      try {
        userRepository.updateUser(event.updatedUser.id, event.updatedUser);
        emit(UpdateSuccessState());
      } catch (e) {
        emit(UpdateFailureState(e.toString()));
      }
    });
  }
}
