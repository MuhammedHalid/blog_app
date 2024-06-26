import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/features/auth/presentation/pages/login_page.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_field.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_gradiant_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SignUpPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignUpPage());
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign Up",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              AuthField(
                controller: nameController,
                hintText: "name",
              ),
              const SizedBox(
                height: 15,
              ),
              AuthField(controller: emailController, hintText: "Email"),
              const SizedBox(
                height: 15,
              ),
              AuthField(controller: passwordController, hintText: "password"),
              const SizedBox(
                height: 30,
              ),
              const AuthGradientButton(
                buttonText: "Sign Up",
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onDoubleTap: () {
                  Navigator.push(context, LoginPage.route());
                },
                child: RichText(
                    text: TextSpan(
                        text: "Already have an account? ",
                        style: Theme.of(context).textTheme.titleMedium,
                        children: [
                      TextSpan(
                        text: "Sign In",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: AppPallete.gradient1,
                                fontWeight: FontWeight.bold),
                      )
                    ])),
              )
            ],
          ),
        ),
      )),
    );
  }
}
