import 'package:flutter/material.dart';

import './login_sereen.dart';

class RegistrationScreen extends StatefulWidget {
  static String routeName = 'registration-screen';
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String? _emailErrorText;
  String? _passwordErrorText;
  String? _confirmPasswordErrorText;
  bool _isHiddenPassword = true;
  bool _isHiddenConfirmPassword = true;

  Widget buildButton(BuildContext context, String text) {
    return ElevatedButton(
      onPressed: () {
        if (_emailController.text.isEmpty == true) {
          setState(() {
            _emailErrorText = 'Please enter valid E-mail.';
          });
        } else {
          setState(() {
            _emailErrorText = null;
          });
        }
        if (_passwordController.text.isEmpty == true) {
          setState(() {
            _passwordErrorText = 'Password can\'t be empty.';
          });
        } else {
          setState(() {
            _passwordErrorText = null;
          });
        }
        if (_confirmPasswordController.text.isEmpty == true) {
          print('ok---------------');
          setState(() {
            _confirmPasswordErrorText = 'Confirm Password can\'t be empty.';
          });
        } else {
          setState(() {
            _confirmPasswordErrorText = null;
          });
        }
        if (_confirmPasswordController.text.isEmpty == false &&
            _passwordController.text != _confirmPasswordController.text) {
          setState(() {
            _confirmPasswordErrorText =
                'Password and Confirm Password don\'t match';
          });
        }
        print(_emailController.text);
        print(_passwordController.text);
        print(_confirmPasswordController.text);
      },
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.89,
        padding: const EdgeInsets.all(10),
        child: Text(
          text,
          style: const TextStyle(fontSize: 19),
        ),
      ),
    );
  }

  void changeScreen() {
    Navigator.of(context)
        .pushReplacementNamed(LoginScreen.routeName, arguments: {});
  }

  Widget buildPasswordTextField(TextEditingController newPasswordController,
      String text, bool isHidden, String? newPasswordErrorText) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 15,
        ),
        TextField(
          controller: newPasswordController,
          obscureText: _isHiddenPassword,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            label: Text(text),
            hintText: text,
            errorText: newPasswordErrorText,
            prefixIcon: const Icon(Icons.password),
            suffixIcon: IconButton(
              icon: const Icon(Icons.remove_red_eye),
              onPressed: () {
                setState(() {
                  _isHiddenPassword = !isHidden;
                });
              },
              tooltip: 'Show $text',
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(
                  'assets/images/background.jpg',
                  fit: BoxFit.fill,
                ),
                Positioned(
                  top: 30,
                  right: 0,
                  left: 0,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 400,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 20,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          border: Border.all(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                label: const Text('E-mail'),
                                hintText: 'Email',
                                errorText: _emailErrorText,
                                prefixIcon: const Icon(Icons.email),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                              ),
                            ),
                            buildPasswordTextField(
                              _passwordController,
                              'Password',
                              _isHiddenPassword,
                              _passwordErrorText,
                            ),
                            buildPasswordTextField(
                              _confirmPasswordController,
                              'Confirm Password',
                              _isHiddenConfirmPassword,
                              _confirmPasswordErrorText,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      buildButton(context, 'Sign Up'),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(fontSize: 19),
                        ),
                      ),
                      TextButton(
                        onPressed: changeScreen,
                        child: const Text(
                          'You have an account?',
                          style: TextStyle(fontSize: 19),
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red.shade100,
                          ),
                          icon: Image.network(
                            'http://pngimg.com/uploads/google/google_PNG19635.png',
                            width: 30,
                            height: 30,
                          ),
                          label: Text(
                            'Sign in with Google',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red.shade900,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          //
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade100,
                          ),
                          icon: Image.network(
                            'https://cdn.iconscout.com/icon/free/png-256/facebook-1464523-1239437.png?f=webp&w=256',
                            height: 30,
                            width: 30,
                            scale: 0.3,
                          ),
                          label: Text(
                            'Sign in with Facebook',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue.shade900,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          //
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
