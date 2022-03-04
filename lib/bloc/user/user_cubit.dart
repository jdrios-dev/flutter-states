import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:singleton/models/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  void selectUser(User user) {
    emit(UserActive(user));
  }

  void changeAge(int age) {
    final currentState = state;
    if (currentState is UserActive) {
      final newUser = currentState.user!.copyWith(age: age);
      emit(UserActive(newUser));
    }
  }

  void addPro() {
    final currentState = state;
    if (currentState is UserActive) {
      final newPro = [...?currentState.user!.professions, 'Hola!'];
      final newUser = currentState.user!.copyWith(professions: newPro);
      emit(UserActive(newUser));
    }
  }
}
