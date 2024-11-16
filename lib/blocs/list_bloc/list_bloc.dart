import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_app/data/repositories/user_repository.dart';
import 'list_event.dart';
import 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final UserRepository userRepository;

  ListBloc(this.userRepository) : super(UsersLoadingState()) {
    on<FetchUsersEvent>((event, emit) async {
      emit(UsersLoadingState());
      try {
        final users = userRepository.getUsers();
        emit(UsersLoadedState(users));
      } catch (e) {
        emit(UsersLoadingErrorState(e.toString()));
      }
    });
  }
}
