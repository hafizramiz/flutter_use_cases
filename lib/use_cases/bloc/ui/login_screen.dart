import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_use_case/use_cases/bloc/bloc_state.dart';
import 'package:flutter_use_case/use_cases/bloc/view_model/LoginViewModel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    context.read<LoginViewModel>().addListener(() {
      final state = context.read<LoginViewModel>();

      /// State kontrolunu is ile kontrol et.
      if (state is LoginSuccess) {
        // Navigate to home screen
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacementNamed(context, '/home');
        });
      }
    });

    /// state bilgisine eristikten sonra kontrol et

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
