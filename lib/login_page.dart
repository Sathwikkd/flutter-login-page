import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'components/text_field.dart';
import 'components/my_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // Text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // Function to send login credentials via HTTP
  Future<void> _login(BuildContext context) async {
    final username = usernameController.text;
    final password = passwordController.text;

    const String apiUrl = 'http://localhost:8000/login';

    try {
      // Send POST request with username and password
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(' ${responseData['message']}')),
        );
      } else {
        // Handle failure (e.g., incorrect credentials)
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login failed, please try again')),
        );
      }
    } catch (e) {
      // Handle errors (like no connection)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[400],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Logo
            Image.asset("assets/logo.png", width: 300, height: 250),

            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 350,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(120)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 65, right: 10, top: 20, bottom: 20),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  MyTextField(
                    icon: Icons.person,
                    controller: usernameController,
                    hintText: 'username',
                    textVisible: false,
                  ),
                  const SizedBox(height: 25),
                  MyTextField(
                    controller: passwordController,
                    hintText: 'password',
                    textVisible: true,
                    icon: Icons.lock,
                  ),
                  const SizedBox(height: 25),

                  // Use MyButton with onPressed callback
                  MyButton(
                    onPressed: () {
                      // Call the login function on button press
                      _login(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
