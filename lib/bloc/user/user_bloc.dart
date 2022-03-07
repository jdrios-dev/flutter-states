import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:singleton/models/user.dart';

part 'user_state.dart';
part 'user_events.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    print('Hola mundo');
    if (event is ActiveUser) {
      yield state.copyWith(user: event.user);
    } else if (event is ChangeAge) {
      yield state.copyWith(user: state.user!.copyWith(age: event.age));
    } else if (event is AddPro) {
      final newPro = [...state.user!.professions, 'new pro'];
      yield state.copyWith(user: state.user!.copyWith(professions: newPro));
    } else if (event is DeleteUser) {
      yield state.initialState();
    }
  }
}
