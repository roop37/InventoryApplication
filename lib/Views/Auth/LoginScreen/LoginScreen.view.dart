import 'package:flutter/material.dart';
import 'package:VedRich/Theme/Spacing.theme.dart';
import 'package:VedRich/Views/App/Dashboard/Dashboard.view.dart';
import 'package:VedRich/Widgets/LogoLarge.widget.dart';

import '../ForgetPassword/ForgetPassword.view.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "auth/login";

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final double uiHeight = 650;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isShowPassword = false;

  toggleShowPassword() => setState(() => isShowPassword = !isShowPassword);

  @override
  Widget build(BuildContext context) {
    _userNameController.text = "1111111111";
    _passwordController.text = "abc@1234";
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Spacings.lg),
        child: SingleChildScrollView(
          child: SizedBox(
            height: uiHeight - kToolbarHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: Spacings.md),
                  child: Hero(
                      tag: "logo",
                      child: Center(child: LogoLarge())),
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
                  direction: Axis.vertical,
                  children: [
                    Text(
                      "Hello",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Get started by signing in!",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.w300, fontSize: 22),
                    ),
                  ],
                ),
                Form(
                  // Login Form
                  key: _formKey,
                  child: SizedBox(
                    height: uiHeight * .35,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFormField(
                          controller: _userNameController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            hintText: "Phone Number",
                            prefixIcon: Padding(
                                padding: EdgeInsets.all(15),
                                child: Text('+91 ')),
                          ),
                          validator: (value) {
                            if (value == null) {
                              return "Phone Number cannot be empty";
                            }
                            if (value.length != 10) {
                              return "Enter a valid phone number";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: !isShowPassword,
                          decoration: InputDecoration(
                            hintText: "Password",
                            suffixIcon: IconButton(
                              onPressed: toggleShowPassword,
                              icon: Icon(
                                !isShowPassword
                                    ? Icons.visibility_rounded
                                    : Icons.visibility_off_rounded,
                              ),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed(DashboardView.routeName);
                            // if (!_formKey.currentState!.validate()) return;
                            //
                            // LoginController.login(
                            //     context,
                            //     _userNameController.text,
                            //     _passwordController.text);
                          },
                          child: const Text("Sign In"),
                        ),
                        TextButton(
                          onPressed: () =>{
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ForgotPasswordPage()))
                          },
                              // LoginController.onForgotPassword(context),
                          child: const Text("forgot password?"),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}