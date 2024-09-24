import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outernet/domain/usecases/authorization_usecase.dart';
import 'package:outernet/presentation/blocs/AuthBloc/auth_events.dart';
import 'package:outernet/presentation/blocs/AuthBloc/auth_state.dart';

class AuthorizationBloc extends Bloc<AuthEvents,AuthState> {
  final AuthorizationUsecase authorizationUsecase;

  AuthorizationBloc(this.authorizationUsecase) : super(InitialAuthentication()) {
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<RegisterRequested>(_onRegisterRequested);
    //on<CheckAuthorizationStatus>(_onCheckAuthorizationStatus);
    on<ForgotPassword>(_onForgotPassword);
    //on<TokenExpired>(_onTokenExpired);
  }

  Future<void> _onLoginRequested(LoginRequested event, Emitter<AuthState> emit) async {
    emit(LoadingAuthState());
    final result = await authorizationUsecase.login(event.email, event.password, event.rememberMe);
    result.fold(
      (failure) => emit(AuthFailed(failure)),
      (user) => emit(Authenticated(user: user))
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
    final result = await authorizationUsecase.register(event.email, event.password, event.name);
    result.fold(
      (failure) => emit(RegisterFailed(failure)),
      (_) => emit(RegisterSuccess())
    );
  }

  // Future<void> _onCheckAuthorizationStatus(CheckAuthorizationStatus event, Emitter<AuthState> emit) async {
  //   emit(LoadingAuthState());
  //   final result = await authorizationUsecase.checkAuthorizationStatus();
  //   result.fold(
  //     (failure) => emit(Unauthenticated()),
  //     (user) => emit(Authenticated(user: user))
  //   );
  // }

  Future<void> _onForgotPassword(ForgotPassword event, Emitter<AuthState> emit) async {
    emit(LoadingAuthState());
    final result = await authorizationUsecase.forgotPassword(event.email);
    result.fold(
      (failure) => emit(AuthFailed(failure)),
      (user) => emit(Authenticated(user: user))
    );
  }

  // Future<void> _onTokenExpired(TokenExpired event, Emitter<AuthState> emit) async {
  //   emit(LoadingAuthState());
  //   final result = await authorizationUsecase.tokenExpired();
  //   result.fold(
  //     (failure) => emit(AuthFailed(failure)),
  //     (user) => emit(Authenticated(user: user))
  //   );
  // }
}