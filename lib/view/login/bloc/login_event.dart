part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {

  
}
class LoginBtn extends LoginEvent{
  final String email;
  final String password;

  LoginBtn({required this.email, required this.password});
  
}
