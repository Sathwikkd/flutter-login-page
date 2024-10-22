
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
part 'auth_event.dart';
part 'auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginEvent>((event, emit)async {
      try {
        emit(AuthLoadingState());
        if(event.username.isEmpty && event.password.isEmpty){
          emit(AuthErrorState(error: 'please enter valid username and password'));
       
       return;
        }

        final jsonResponce=await http.post(
          Uri.parse('http://localhost:8000/login'),
          body: jsonEncode({
            'username':event.username,
            'password':event.password,

          }),
        );
        if (jsonResponce.statusCode == 200){
          final response = jsonDecode(jsonResponce.body);

          if(response['status']=='success'){
            emit(AuthSuccessState());
          }else{
            emit(AuthErrorState(error: 'server error!..please try again..'));
          }
        }
      }
       catch (e) {
        emit(AuthErrorState(error: e.toString()));
        
      }
    });
  }
}
