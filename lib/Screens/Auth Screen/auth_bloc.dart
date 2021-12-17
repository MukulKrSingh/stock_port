import 'package:rxdart/rxdart.dart';
import 'package:stock_port/Screens/Auth%20Screen/authValidator.dart';
import '../Auth Screen/auth_firestore_services.dart';



class AuthBloc extends AuthValidator{

  AuthFireServices fireServices = new AuthFireServices();


  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _contact = BehaviorSubject<String>();
  final _name = BehaviorSubject<String>();


  //getter to stream
  Stream<String> get name => _name.stream;

  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);
  Stream<bool> get submitValid => Rx.combineLatest2(email, password, (a, b) => true);
  Stream<String> get contact => _contact.stream.transform(validateContact);
  Stream<bool> get registerValid => Rx.combineLatest4(email, password, contact, name, (a, b, c, d) => true);


  //getters to sink
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;
  Function(String) get changeContact => _contact.sink.add;
  Function(String) get changeName => _name.sink.add;


  Future<bool> submit() async {
    bool shouldNav;
    final validMail = _email.value;
    final validPass = _password.value;

    print('In submit');

   shouldNav = await fireServices.logIn(validMail,validPass);

   return shouldNav;
  }


  register() async {
    bool shouldNav;
    final validMail = _email.value;
    final validPass = _password.value;
    final validName = _name.value;
    final validContact = _contact.value;

    print("Registering user\n");

    var registerResult = await fireServices.register(email: validMail,
    name: validName,
    contact: validContact,
    password: validPass
    );

    return registerResult;

    // print('$validMail');
    // print('$validPass');
    // print('$validName');
    // print('$validContact');

    dispose();
  }


  dispose() {

    _email.close();
    _password.close();
    _contact.close();
    _name.close();
  }
}