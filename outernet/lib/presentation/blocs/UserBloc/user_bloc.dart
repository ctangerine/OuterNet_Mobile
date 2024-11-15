import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outernet/domain/usecases/user_usecase.dart';
import 'package:outernet/presentation/blocs/UserBloc/user_events.dart';
import 'package:outernet/presentation/blocs/UserBloc/user_state.dart';

class UserBloc extends Bloc<UserEvents, UserState> {
  final UserUsecase userUsecase;

  UserBloc(this.userUsecase) : super(InitalUser()) {
    on<AddUserName>(_onAddUserName);
    on<ChangeUserProfile>(_onChangeUserProfile);
  }

  Future<void> _onAddUserName(AddUserName event, Emitter<UserState> emit) async {
    if (true) {
      final updateUser = await userUsecase.addUserName(event.name);

      updateUser.fold(
        (failure) => emit(LoadUserFailed(failure.message)),
        (user) => emit(UserLogedIn(user: user))
      );
      //emit((state as UserLogedIn).copyWith(user: updateUser));
    }
    else {
      emit(LoadUserFailed('User not loged in'));
    }
  }

  Future<void> _onChangeUserProfile(ChangeUserProfile event, Emitter<UserState> emit) async {
    if (state is UserLogedIn) {
      final updateUser = await userUsecase.changeUserProfile(event.name, event.email, event.phone, event.profileImage);
      //emit((state as UserLogedIn).copyWith(user: updateUser));
      updateUser.fold(
        (failure) => emit(LoadUserFailed(failure.message)),
        (user) => emit(UserLogedIn(user: user))
      );
    }
    else {
      emit(LoadUserFailed('User not loged in'));
    }
  }
}