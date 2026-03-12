import 'package:flutter/material.dart';
import 'package:latihan_kuis_a/screen/moviel_list_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userC = TextEditingController();
  final TextEditingController passC = TextEditingController();
  bool isLoggedIn = false;

  void _login() {
    if (userC.text == "bella" && passC.text == "058") {
      setState(() {
        isLoggedIn = true;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MovieListPage()),
        );
      });
    } else {
      setState(() {
        isLoggedIn = false;
      });
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(isLoggedIn ? 'Login Berhasil!' : 'Login Gagal!'),
        backgroundColor: isLoggedIn ? Colors.green : Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Login',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Welcome back to MiniLens!',
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            const SizedBox(height: 32),
            _usernameField(),
            const SizedBox(height: 16),
            _passwordField(),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 122, 3, 3),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return TextField(
      controller: userC,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Username',
      ),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: passC,
      obscureText: true,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Password',
      ),
    );
  }
}
