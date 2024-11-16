import 'package:form_app/data/models/user_model.dart';

abstract class ListEvent {}

class FetchUsersEvent extends ListEvent {}

class UpdateUserListEvent extends ListEvent {
  final User updatedUser;

  UpdateUserListEvent(this.updatedUser);
}
