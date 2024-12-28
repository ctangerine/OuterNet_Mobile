import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outernet/data/data_sources/local_datasouces/drift_database.dart';
import 'package:outernet/data/data_sources/local_datasouces/drift_database_provider.dart';
import 'package:outernet/domain/entities/failure.dart';
import 'package:outernet/domain/usecases/authorization_usecase.dart';
import 'package:outernet/presentation/blocs/AuthBloc/auth_events.dart';
import 'package:outernet/presentation/blocs/AuthBloc/auth_state.dart';

class AuthorizationBloc extends Bloc<AuthEvents,AuthState> {
  final AuthorizationUsecase authorizationUsecase;
  final AppDatabase _db = dbProvider.database;

  AuthorizationBloc(this.authorizationUsecase) : super(InitialAuthentication()) {
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<RegisterRequested>(_onRegisterRequested);
    //on<CheckAuthorizationStatus>(_onCheckAuthorizationStatus);
    //on<TokenExpired>(_onTokenExpired);
  }

  Future<void> _onLoginRequested(LoginRequested event, Emitter<AuthState> emit) async {
    emit(LoadingAuthState());
    final result = await authorizationUsecase.login(event.email, event.password, event.rememberMe);
    result.fold(
      (failure) => emit(AuthFailed(failure)),
      (user) {
        emit(Authenticated(user: user));
      }
    );
  }

  Future<void> _onLogoutRequested(LogoutRequested event, Emitter<AuthState> emit) async {
    emit(LoadingAuthState());
    final result = await authorizationUsecase.logout();
    result.fold(
      (failure) => emit(LogoutFailed(failure)),
      (_) => emit(LogoutSuccess())
    );
  }

  Future<void> _onRegisterRequested(RegisterRequested event, Emitter<AuthState> emit) async {
    emit(LoadingAuthState());
    try {
      final result = await authorizationUsecase.register(event.email, event.password, event.name);
      // Should use await with this function because without await, the function will return a Future object accidentally and the fold function will not work
      await result.fold(
        (failure) async {
          emit(RegisterFailed(failure));
        },
        (_) async {
          try {
            final otpResult = await authorizationUsecase.getOtp();
            otpResult.fold(
              (failure) => emit(RegisterFailed(failure)),
              (otp) => emit(RegisterSuccess(otp))
            );
          } catch (e) {
            emit(RegisterFailed(Failure(e.toString())));
          }
        }
      );
    } catch (e) {
      emit(RegisterFailed(Failure(e.toString())));
    }
  }

  // Future<void> _onCheckAuthorizationStatus(CheckAuthorizationStatus event, Emitter<AuthState> emit) async {
  //   emit(LoadingAuthState());
  //   final result = await authorizationUsecase.checkAuthorizationStatus();
  //   result.fold(
  //     (failure) => emit(Unauthenticated()),
  //     (user) => emit(Authenticated(user: user))
  //   );
  // }

  // Future<void> _onTokenExpired(TokenExpired event, Emitter<AuthState> emit) async {
  //   emit(LoadingAuthState());
  //   final result = await authorizationUsecase.tokenExpired();
  //   result.fold(
  //     (failure) => emit(AuthFailed(failure)),
  //     (user) => emit(Authenticated(user: user))
  //   );
  // }
}