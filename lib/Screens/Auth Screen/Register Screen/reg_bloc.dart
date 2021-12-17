
import 'package:rxdart/rxdart.dart';
import 'package:stock_port/Screens/Auth%20Screen/authValidator.dart';

class RegBloc extends AuthValidator {


  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _name = BehaviorSubject<String>();
  final _contact = BehaviorSubject<String>();



  //getter to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get registerValid => Rx.combineLatest2(email, password, (a, b) => true);





}