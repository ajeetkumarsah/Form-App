import 'package:form_app/data/models/user_model.dart';

abstract class ListState {}

class UsersLoadingState extends ListState {}

class UsersLoadedState extends ListState {
  final List<User> users;

  UsersLoadedState(this.users);
}

class UsersLoadingErrorState extends ListState {
  final String error;

  UsersLoadingErrorState(this.error);
}

class UserUpdatedState extends ListState {
  final User updatedUser;

  UserUpdatedState(this.updatedUser);
}
