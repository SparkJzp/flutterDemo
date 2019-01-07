import 'dart:async';
import 'validator.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Object with Validators implements BaseBloc {
  var _emailCtrl = new StreamController<String>();
  var _passwordCtrl = new StreamController<String>();

  Function(String) get emailChanged => _emailCtrl.sink.add;
  Function(String) get passwordChanged => _passwordCtrl.sink.add;

  Stream<String> get email => _emailCtrl.stream.transform(emailValidator);
  Stream<String> get password =>
      _passwordCtrl.stream.transform(passwordValidator);

  Stream<bool> get submitCheck =>
      Observable.combineLatest2(email, password, (e, p) => true);

  sumbit(){
    
  }


  @override
  void dispose() {
    _emailCtrl?.close();
    _passwordCtrl?.close();
  }
}

abstract class BaseBloc {
  void dispose();
}
