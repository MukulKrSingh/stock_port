import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Auth Screen/auth_bloc.dart';
export '../Auth Screen/auth_bloc.dart';



class AuthBlocProvider extends InheritedWidget {

  final AuthBloc authBloc = AuthBloc();

  AuthBlocProvider({Key key,Widget child}) : super(key: key,child: child);



  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
    throw UnimplementedError();
  }
  static AuthBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<AuthBlocProvider>()).authBloc;
  }
}