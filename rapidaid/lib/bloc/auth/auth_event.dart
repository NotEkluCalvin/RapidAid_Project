// abstract class AuthEvent {}

// class SignUpRequested extends AuthEvent {
//   final String username;
//   final String? email;
//   final String? phoneNumber;
//   final String password;
//   final String dateOfBirth;

//   SignUpRequested({
//     required this.username,
//     this.email,
//     this.phoneNumber,
//     required this.password,
//     required this.dateOfBirth,
//   });
// }

// class LoginRequested extends AuthEvent {
//   final String username;
//   final String password;
//   final bool rememberMe;

//   LoginRequested({
//     required this.username,
//     required this.password,
//     this.rememberMe = false,
//   });
// }

// class PasswordResetRequested extends AuthEvent {
//   final String email;

//   PasswordResetRequested({required this.email});
// }

// class SignOutRequested extends AuthEvent {}

abstract class AuthEvent {}

class LoginRequested extends AuthEvent {
  final String username;
  final String password;
  final bool rememberMe;

  LoginRequested({
    required this.username,
    required this.password,
    this.rememberMe = false,
  });
}

class LoginSucceeded extends AuthEvent {
  final bool rememberMe;

  LoginSucceeded({this.rememberMe = false});
}

class LoginFailed extends AuthEvent {
  final String message;

  LoginFailed({required this.message});
}

class PasswordResetRequested extends AuthEvent {
  final String email;

  PasswordResetRequested({required this.email});
}

class SignupRequested extends AuthEvent {
  final String username;
  final String email;
  final String password;

  SignupRequested({
    required this.username,
    required this.email,
    required this.password,
  });
}

class LogoutRequested extends AuthEvent {}
