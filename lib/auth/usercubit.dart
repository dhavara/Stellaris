part of 'auth.dart';

class UserCubit extends Cubit<User?> {
  UserCubit(User? state) : super(state);

  void login(User user) => emit(user);

  void logout() => emit(null);
}
