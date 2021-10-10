import 'package:demo_app/src/modules/auth/service/auth_service.dart';
import 'package:flutter/material.dart';

class LoginViewModel {
  final TextEditingController email = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController lastName = TextEditingController();

  final BuildContext context;
  final AuthService _authService;

  final formKey = GlobalKey<FormState>();

  LoginViewModel(this.context, this._authService);

  void register() {
    if (formKey.currentState?.validate() ?? false) {
      _authService.register(email.text, name.text, lastName.text);
      goNext();
    }
  }

  void goNext() {
    Navigator.of(context).pushReplacementNamed('/showroom');
  }
}
