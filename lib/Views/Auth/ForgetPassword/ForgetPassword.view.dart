import 'package:flutter/material.dart';
import 'package:VedRich/Theme/Spacing.theme.dart';
import 'package:VedRich/Views/Auth/LoginScreen/LoginScreen.view.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const String routeName = "auth/forgot_password";

  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  void _resetPassword() {
    // Perform reset password logic here
    // You can make a POST request to the reset password API
    // Handle success and error cases accordingly

    // Example:
    // Call the API with the required parameters
    // ForgotPasswordController.resetPassword(
    //   context,
    //   email: _emailController.text,
    // );

    // Handle success and error cases based on the API response
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password",style: TextStyle(color: Theme.of(context).dividerColor)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,
            color: Theme.of(context).dividerColor,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()));
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: Spacings.md),
                child: Center(
                  child: Image.asset(
                    'assets/logos/forget.png',
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
              SizedBox(height: 24),

              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email address",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email is required";
                  }
                  // Add email validation logic if needed
                  return null;
                },
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _resetPassword();
                  }
                },
                child: Text("Reset Password"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
