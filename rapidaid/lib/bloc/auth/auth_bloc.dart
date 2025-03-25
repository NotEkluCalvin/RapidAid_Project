// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../repositories/auth_repository.dart';
// import 'auth_event.dart';
// import 'auth_state.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   final AuthRepository authRepository;

//   AuthBloc({required this.authRepository}) : super(AuthInitial()) {
//     on<SignUpRequested>(_onSignUpRequested);
//     on<LoginRequested>(_onLoginRequested);
//     on<PasswordResetRequested>(_onPasswordResetRequested);
//     on<SignOutRequested>(_onSignOutRequested);
//   }

//   Future<void> _onSignUpRequested(
//     SignUpRequested event,
//     Emitter<AuthState> emit,
//   ) async {
//     emit(AuthLoading());
//     try {
//       await authRepository.signUp(
//         username: event.username,
//         email: event.email,
//         phoneNumber: event.phoneNumber,
//         password: event.password,
//         dateOfBirth: event.dateOfBirth,
//       );
//       emit(AuthSuccess());
//     } catch (e) {
//       emit(AuthFailure(message: e.toString()));
//     }
//   }

//   Future<void> _onLoginRequested(
//     LoginRequested event,
//     Emitter<AuthState> emit,
//   ) async {
//     emit(AuthLoading());

//     try {
//       await authRepository.login(
//         username: event.username,
//         password: event.password,
//         rememberMe: event.rememberMe,
//       );
//       emit(AuthSuccess());
//     } catch (e) {
//       emit(AuthFailure(message: e.toString()));
//     }
//   }

//   Future<void> _onPasswordResetRequested(
//     PasswordResetRequested event,
//     Emitter<AuthState> emit,
//   ) async {
//     emit(AuthLoading());
//     try {
//       await authRepository.resetPassword(email: event.email);
//       emit(AuthSuccess());
//     } catch (e) {
//       emit(AuthFailure(message: e.toString()));
//     }
//   }

//   Future<void> _onSignOutRequested(
//     SignOutRequested event,
//     Emitter<AuthState> emit,
//   ) async {
//     emit(AuthLoading());
//     try {
//       await authRepository.signOut();
//       emit(AuthInitial());
//     } catch (e) {
//       emit(AuthFailure(message: e.toString()));
//     }
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<LoginSucceeded>(_onLoginSucceeded);
    on<LoginFailed>(_onLoginFailed);
    on<PasswordResetRequested>(_onPasswordResetRequested);
    on<SignupRequested>(_onSignupRequested);
    // on<LogoutRequested>(_onLogoutRequested);
  }

  void _onLoginRequested(LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      // In a real app, you would validate credentials against a backend
      await Future.delayed(
        const Duration(seconds: 1),
      ); // Simulate network delay

      // Check for hardcoded credentials
      if (event.username == 'ekcalvin' && event.password == '12345') {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure(message: 'Invalid username or password'));
      }
    } catch (e) {
      emit(AuthFailure(message: 'Login failed: ${e.toString()}'));
    }
  }

  void _onLoginSucceeded(LoginSucceeded event, Emitter<AuthState> emit) {
    emit(AuthSuccess());
    // You could store the remember me preference here
  }

  void _onLoginFailed(LoginFailed event, Emitter<AuthState> emit) {
    emit(AuthFailure(message: event.message));
  }

  void _onPasswordResetRequested(
    PasswordResetRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      // Simulate password reset request
      await Future.delayed(const Duration(seconds: 1));
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailure(message: 'Password reset failed: ${e.toString()}'));
    }
  }

  void _onSignupRequested(
    SignupRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
  }

  // try {
  //   // Simulate user registration
  //   await Future.delayed(const Duration(seconds: 1));
}
