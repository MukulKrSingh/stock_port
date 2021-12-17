import 'package:flutter/material.dart';
import 'package:stock_port/Screens/Auth%20Screen/Register%20Screen/register_screen.dart';
import 'package:stock_port/Screens/Auth%20Screen/auth_screen.dart';
import 'package:stock_port/Screens/Home%20Screen/home_screen.dart';
import 'Screens/Auth Screen/auth_bloc_provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AuthBlocProvider(
      child:GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          //print('tapped');
          if(!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
            FocusManager.instance.primaryFocus.unfocus();        }
        },
        child: MaterialApp(
          initialRoute: "/",
          routes: {
            '/':(context)=> AuthScreen(),
            '/HomeScreen':(context) => HomeScreen(),
            '/RegisterScreen':(context) => RegisterScreen()
          },
        ),
      ) ,
    );

    throw UnimplementedError();
  }
}
