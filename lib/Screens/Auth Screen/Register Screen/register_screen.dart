import 'package:flutter/services.dart';
import 'package:stock_port/Screens/Auth%20Screen/auth_bloc_provider.dart';
import '../auth_bloc_provider.dart';
import '../auth_bloc.dart';
import '../auth_firestore_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final authBloc = AuthBlocProvider.of(context);
    AuthFireServices fireServices = new AuthFireServices();
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Account'),
      ),
      body: Center(
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              nameField(context,authBloc),
              SizedBox(
                height: 5.0,
              ),
              emailField(context,authBloc),
              SizedBox(
                height: 5.0,
              ),
              SizedBox(
                height: 5.0,
              ),
              contactField(context,authBloc),
              SizedBox(
                height: 5.0,
              ),
              passwordField(context,authBloc),
              SizedBox(
                height: 5.0,
              ),
              registerButton(context, authBloc),
            ],
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }

  Widget nameField(BuildContext context, AuthBloc authBloc) {
    return StreamBuilder(
        stream: authBloc.name,
        builder: (context, AsyncSnapshot<String> snapshot) {
          return Container(
            margin: EdgeInsets.all(10.0),
            child: TextField(
              onChanged: authBloc.changeName,
              decoration: InputDecoration(
                labelText: "Name",
                hintText: "Enter your name",
              ),
            ),
          );
        });

    //
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

  Widget contactField(BuildContext context,AuthBloc authBloc) {

    return StreamBuilder(
      stream: authBloc.contact,
      builder: (context,AsyncSnapshot<String> snapshot) {
        return Container(
          margin: EdgeInsets.all(10.0),
          child: TextField(
            keyboardType: TextInputType.phone,
            onChanged: authBloc.changeContact,
            decoration: InputDecoration(
              labelText: "Phone Number",
              hintText: "Ph No. must be 10 char long only",
              errorText: snapshot.error,
            ),
          ),
        );
      },
    );
  }



  Widget registerButton(BuildContext context, AuthBloc authBloc) {
    return StreamBuilder(
      stream: authBloc.submitValid,
      builder: (context, snapshot) {
        return ElevatedButton(
          child: Text('Register'),
          onPressed: () async{

            var result = await authBloc.register();
            if(result){
              Navigator.pushReplacementNamed(context, '/HomeScreen');
            }
            else {
              print("Could not register user.");
            }


          },
        );
      },
    );
  }
}
