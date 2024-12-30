import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outernet/data/data_sources/dio_network/base_api_service.dart';
import 'package:outernet/data/data_sources/local_datasouces/drift_database.dart';
import 'package:outernet/data/data_sources/local_datasouces/drift_database_provider.dart';
import 'package:outernet/domain/entities/user_entity.dart';
import 'package:outernet/domain/usecases/user_usecase.dart';
import 'package:outernet/presentation/blocs/UserBloc/user_events.dart';
import 'package:outernet/presentation/blocs/UserBloc/user_state.dart';

class UserBloc extends Bloc<UserEvents, UserState> {
  final UserUsecase userUsecase;
  final AppDatabase _db = dbProvider.database;

  UserBloc(this.userUsecase) : super(InitalUser()) {
    on<AddUserName>(_onAddUserName);
    on<ChangePasswordEvent>(_onChangePassword);
    on<UpdateAvatarEvent>(_onUpdateAvatar);
    on<UpdateBasicInfoEvent>(_onUpdateBasicInfo);
    on<UpdateDetailInfoEvent>(_onUpdateDetailInfo);
    on<UpdateEmailEvent>(_onUpdateEmail);
    on<DeactivateAccountEvent>(_onDeactivateAccount);
    on<GetUserDetailEvent>(_onGetUserDetail);
    on<GetOtherUserEvent>(_onGetOtherUser);
    on<SearchUserEvent>(_onSearchUser);
  }

  Future<void> _onAddUserName(AddUserName event, Emitter<UserState> emit) async {
    final updateUser = await userUsecase.addUserName(event.name);

    updateUser.fold(
      (failure) => emit(LoadUserFailed(failure.message)),
      (user) {
        try {
          emit(UserLogedIn(user: user));
        } catch (e) {
          emit(UserLogedIn(user: user, error: e.toString()));
        }
      },
    );
  }

  Future<void> _onChangePassword(ChangePasswordEvent event, Emitter<UserState> emit) async {
    final result = await userUsecase.changePassword(event.request);

    result.fold(
      (failure) {
        emit((state as UserLogedIn).copyWith(error: failure.message));
      },
      (message) {
        try {
          emit((state as UserLogedIn).copyWith(isPasswordChanged: true, message: message));
        } catch (e) {
          emit(UserLogedIn(user: UserEntity.defaultInstance, error: e.toString()));
        }
      },
    );
  }

  Future<void> _onUpdateAvatar(UpdateAvatarEvent event, Emitter<UserState> emit) async {
    final result = await userUsecase.updateAvatar(event.request);

    result.fold(
      (failure) {
        emit((state as UserLogedIn).copyWith(error: failure.message));
      },
      (message) {
        try {
          emit((state as UserLogedIn).copyWith(isAvatarChanged: true, message: message));
        } catch (e) {
          emit(UserLogedIn(user: UserEntity.defaultInstance, error: e.toString()));
        }
      },
    );
  }

  Future<void> _onUpdateBasicInfo(UpdateBasicInfoEvent event, Emitter<UserState> emit) async {
    final result = await userUsecase.updateBasicInfo(event.request);

    result.fold(
      (failure) {
        emit((state as UserLogedIn).copyWith(error: failure.message));
      },
      (message) {
        try {
          emit((state as UserLogedIn).copyWith(isBasicInfoChanged: true, message: message));
        } catch (e) {
          emit(UserLogedIn(user: UserEntity.defaultInstance, error: e.toString()));
        }
      },
    );
  }

  Future<void> _onUpdateDetailInfo(UpdateDetailInfoEvent event, Emitter<UserState> emit) async {
    final result = await userUsecase.updateDetailInfo(event.request);

    result.fold(
      (failure) {
        emit((state as UserLogedIn).copyWith(error: failure.message));
      },
      (message) {
        try {
          emit((state as UserLogedIn).copyWith(isProfileChanged: true, message: message));
        } catch (e) {
          emit(UserLogedIn(user: UserEntity.defaultInstance, error: e.toString()));
        }
      },
    );
  }

  Future<void> _onUpdateEmail(UpdateEmailEvent event, Emitter<UserState> emit) async {
    final result = await userUsecase.updateEmail(event.request);

    result.fold(
      (failure) {
        emit((state as UserLogedIn).copyWith(error: failure.message));
      },
      (message) {
        try {
          emit((state as UserLogedIn).copyWith(isEmailChanged: true, message: message));
        } catch (e) {
          emit(UserLogedIn(user: UserEntity.defaultInstance, error: e.toString()));
        }
      },
    );
  }

  Future<void> _onDeactivateAccount(DeactivateAccountEvent event, Emitter<UserState> emit) async {
    final result = await userUsecase.deactivateAccount();

    result.fold(
      (failure) {
        emit((state as UserLogedIn).copyWith(error: failure.message));
      },
      (message) {
        try {
          emit((state as UserLogedIn).copyWith(isDeactivated: true, message: message));
        } catch (e) {
          emit(UserLogedIn(user: UserEntity.defaultInstance, error: e.toString()));
        }
      },
    );
  }

  Future<void> _onGetUserDetail(GetUserDetailEvent event, Emitter<UserState> emit) async {
    final localUser = await _db.getCurrentUser();
    
    if (localUser != null) {
      emit(UserLogedIn(user: localUser));
    } 
    else {
      logger.e('Cannot get user from local database');
    }

    final result = await userUsecase.getUserDetail();

    result.fold(
      (failure) {
        emit((state as UserLogedIn).copyWith(error: failure.message));
      },
      (user) {
        try {
          emit((state as UserLogedIn).copyWith(user: user));
        } catch (e) {
          emit(UserLogedIn(user: user, error: e.toString()));
        }
      },
    );
  }

  Future<void> _onGetOtherUser(GetOtherUserEvent event, Emitter<UserState> emit) async {
    final result = await userUsecase.getOtherUser(event.userId);

    result.fold(
      (failure) {
        emit((state as UserLogedIn).copyWith(error: failure.message));
      },
      (user) {
        try {
          emit((state as UserLogedIn).copyWith(user: user));
        } catch (e) {
          emit(UserLogedIn(user: user, error: e.toString()));
        }
      },
    );
  }

  Future<void> _onSearchUser(SearchUserEvent event, Emitter<UserState> emit) async {
    final result = await userUsecase.searchUser(event.request);

    result.fold(
      (failure) {
        emit((state as UserLogedIn).copyWith(error: failure.message));
      },
      (users) {
        try {
          emit((state as UserLogedIn).copyWith(users: users, isUserSearched: true));
        } catch (e) {
          emit(UserLogedIn(users: users, user: UserEntity.defaultInstance, error: e.toString()));
        }
      },
    );
  }
}