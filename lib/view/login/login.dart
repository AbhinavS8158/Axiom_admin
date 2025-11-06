import 'package:axiom_admin/view/dashboard/category_selection_screen.dart';
import 'package:axiom_admin/view/login/bloc/login_bloc.dart';
import 'package:axiom_admin/view/login/widgets/loginfeilds.dart';
import 'package:axiom_admin/view/login/widgets/loginimage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Login Success")));
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AdminDashboard(),
          )
          );
          }
          if(state is LoginError){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Incorrect Email and Password"),
              duration: Duration(seconds: 2),
              )
            );
          }
        },
        builder: (context, state) {
          return buidScaffold(context);
        }
      ),
    );
  }

  Widget buidScaffold(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Color(0xFFF5F5F5)],
          ),
        ),
        child: Row(
          children: const [Loginimge(), Expanded(child: Loginfields())],
        ),
      ),
    );
  }
}
