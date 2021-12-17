import 'dart:async';


class AuthValidator {

  final validateEmail = StreamTransformer<String,String>.fromHandlers(
      handleData: (email,sink) {
        if(email.contains('@')){
          sink.add(email);
        } else {
          sink.addError('Enter a valid email');
        }
      }
  );

  final validatePassword = StreamTransformer<String,String>.fromHandlers(
      handleData: (password,sink) {
        if(password.length > 4) {
          sink.add(password);
        } else {
          sink.addError('password should be minimum 4 characters ');
        }
      }
  );

  final validateContact = StreamTransformer<String,String>.fromHandlers(
    handleData: (contact,sink) {
      if(contact.length==10) {
        sink.add(contact);
      }
      else {
        sink.addError("Phone number must be 10 chars long");
      }
    }
  );
}