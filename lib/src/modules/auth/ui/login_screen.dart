import 'package:demo_app/src/di/container.dart';
import 'package:demo_app/src/modules/auth/service/auth_service.dart';
import 'package:demo_app/src/modules/auth/service/repository/auth_repository.dart';
import 'package:demo_app/src/modules/auth/ui/login_view_model.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginViewModel _viewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _viewModel = LoginViewModel(
      context,
      AuthService(
        AuthRepository(),
        Di.instance.profileRepository,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Добро пожаловать!',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(height: 100),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.black26,
                      blurRadius: 2,
                      spreadRadius: 1,
                      offset: Offset(
                        0,
                        1,
                      ),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    _RegistrationForm(
                      formKey: _viewModel.formKey,
                      emailController: _viewModel.email,
                      nameController: _viewModel.name,
                      lastNameController: _viewModel.lastName,
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: _viewModel.register,
                      child: const Text('Войти'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegistrationForm extends StatelessWidget {
  final Key formKey;
  final TextEditingController emailController;
  final TextEditingController nameController;
  final TextEditingController lastNameController;

  const _RegistrationForm({
    Key? key,
    required this.formKey,
    required this.emailController,
    required this.nameController,
    required this.lastNameController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              hintText: 'Email',
            ),
            validator: (text) {
              if (text?.isEmpty ?? false) {
                return 'Заполните поле';
              }
              
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: 'Имя',
            ),
            validator: (text) {
              if (text?.isEmpty ?? false) {
                return 'Заполните поле';
              }
              
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: lastNameController,
            decoration: const InputDecoration(
              hintText: 'Фамилия',
            ),
            validator: (text) {
              if (text?.isEmpty ?? false) {
                return 'Заполните поле';
              }
              
              return null;
            },
          ),
        ],
      ),
    );
  }
}
