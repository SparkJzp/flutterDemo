import 'dart:async';
import 'validator.dart';

class Bloc extends Object with Validators implements BaseBloc {
  var _emailCtrl = new StreamController<String>();
  var _passwordCtrl = new StreamController<String>();

  Stream<String> get eamil => _emailCtrl.stream.transform(emailValidator);
  Stream<String> get password =>
      _passwordCtrl.stream.transform(passwordValidator);

  @override
  void dispose() {
    _emailCtrl?.close();
    _passwordCtrl?.close();
  }
}

abstract class BaseBloc {
  void dispose();
}
