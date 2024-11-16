import 'package:form_app/data/models/user_model.dart';

abstract class UpdateEvent {}

class SubmitUpdateEvent extends UpdateEvent {
  final User updatedUser;

  SubmitUpdateEvent({required this.updatedUser});
}
