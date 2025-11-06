import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginBtn>((event, emit) {
     const String hardcodedEmail = 'admin@axiom.com';
  const String hardcodedPassword = '123456';

  if(event.email ==  hardcodedEmail &&  event.password == hardcodedPassword){
    emit(LoginSuccess());
    
  }else{
    emit(LoginError());
  }
    });
  }
}
