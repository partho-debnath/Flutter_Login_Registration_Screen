import 'package:flutter/material.dart';

import './registration_screen.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = 'login-screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _emailErrorText = null;
  String? _passwordErrorText = null;
  bool _isHidden = true;

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
        print(_emailController.text);
        print(_passwordController.text);
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
        .pushNamed(RegistrationScreen.routeName, arguments: {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in'),
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
                  top: 100,
                  right: 0,
                  left: 0,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 400,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
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
                            const SizedBox(
                              height: 15,
                            ),
                            TextField(
                              controller: _passwordController,
                              obscureText: _isHidden,
                              obscuringCharacter: '*',
                              decoration: InputDecoration(
                                label: const Text('Password'),
                                hintText: 'Password',
                                errorText: _passwordErrorText,
                                prefixIcon: const Icon(Icons.password),
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.remove_red_eye),
                                  onPressed: () {
                                    setState(() {
                                      _isHidden = !_isHidden;
                                    });
                                  },
                                  tooltip: 'Show Password',
                                ),
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                              ),
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
                      buildButton(context, 'Sign in'),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(fontSize: 19),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'You have\'t an account?',
                            style: TextStyle(fontSize: 16),
                          ),
                          TextButton(
                            onPressed: changeScreen,
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(fontSize: 19),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade100,
                        ),
                        icon: const Icon(Icons.facebook),
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
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade100,
                        ),
                        child: RichText(
                          text: TextSpan(
                            text: 'G  ',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.red.shade900,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Sign in with Google    ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.red.shade900,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ],
                          ),
                        ),
                        //
                      )
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
