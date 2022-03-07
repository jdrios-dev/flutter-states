part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActiveUser extends UserEvent {
  final User user;
  ActiveUser(this.user);
}

class ChangeAge extends UserEvent {
  final int age;

  ChangeAge(this.age);
}

class AddPro extends UserEvent {
  AddPro();
}

class DeleteUser extends UserEvent {
  DeleteUser();
}
