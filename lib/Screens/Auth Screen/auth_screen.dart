import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stock_port/Screens/Home%20Screen/home_screen.dart';
import '../Auth Screen/auth_bloc_provider.dart';
import '../Auth Screen/auth_firestore_services.dart';
import 'Register Screen/register_screen.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final authBloc = AuthBlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login/SignUp'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle_outlined,
                  size: 100.0,
                ),
                emailField(context, authBloc),
                SizedBox(
                  height: 5.0,
                ),
                passwordField(context, authBloc),
                SizedBox(height: 5.0),
                loginButton(context, authBloc),
                SizedBox(
                  height: 10.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/RegisterScreen');
                  },
                  child: Text(
                    "Create/Register an account",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }

  Widget emailField(BuildContext context, AuthBloc authBloc) {
    return StreamBuilder(
        stream: authBloc.email,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return Container(
            margin: EdgeInsets.all(10.0),
            child: TextField(
              onChanged: authBloc.changeEmail,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "abc@example.com",
                errorText: snapshot.error,
              ),
            ),
          );
        });

    //
  }

  Widget passwordField(BuildContext context, AuthBloc authBloc) {
    return StreamBuilder(
      stream: authBloc.password,
      builder: (context, AsyncSnapshot<String> snapshot) {
        return Container(
          margin: EdgeInsets.all(10.0),
          child: TextField(
            onChanged: authBloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                errorText: snapshot.error),
          ),
        );
      },
    );
  }

  Widget loginButton(BuildContext context, AuthBloc authBloc) {
    return StreamBuilder(
      stream: authBloc.submitValid,
      builder: (context, snapshot) {
        return ElevatedButton(
          child: Text('Login'),
          onPressed: () async {
            bool shouldNav;
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
              FocusManager.instance.primaryFocus.unfocus();

              shouldNav = await authBloc.submit();
              if (shouldNav) {
                Navigator.pushReplacementNamed(context, '/HomeScreen');
                authBloc.dispose();
              }
            }
          },
        );
      },
    );
  }

  register() {
    print("Register button pressed!");
  }
}

/*Code to show why Login button is implemented using Stream becoz if not then it will accept values without validating that is it will
    accept values if one of the value is validated.
  // Widget loginButton(BuildContext context, AuthBloc authBloc) {
  //       return ElevatedButton(
  //           child: Text('Login'),
  //           onPressed: () {
  //             FocusScopeNode currentFocus = FocusScope.of(context);
  //             if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
  //               FocusManager.instance.primaryFocus.unfocus();
  //             }
  //               authBloc.submit();
  //           }
  //       );
  //     }
*/
