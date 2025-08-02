import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Регистрация',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      home: const RegistrationApp(),
    );
  }
}

class RegistrationApp extends StatefulWidget {
  const RegistrationApp({super.key});

  @override
  State<RegistrationApp> createState() => _RegistrationAppState();
}

class _RegistrationAppState extends State<RegistrationApp> {
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  final _ageController = TextEditingController();

  // -----------------------------------------------------------
  // Отправка запроса на сервер
  // -----------------------------------------------------------
  Future<void> registerUser() async {
    const url = 'http://192.168.1.37:8082/api/register';

    final body = jsonEncode({
      "firstname": _firstnameController.text.trim(),
      "lastname": _lastnameController.text.trim(),
      "age": _ageController.text.trim(),
      "login": _loginController.text.trim(),
      "password": _passwordController.text.trim(),
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: body,
      ).timeout(const Duration(seconds: 5));

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('✅ Регистрация прошла успешно')),
        );
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('❌ Ошибка: ${response.statusCode}')),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('🛜 Ошибка сети: $e')),
      );
    }
  }

  // -----------------------------------------------------------
  // Очистка контроллеров
  // -----------------------------------------------------------
  @override
  void dispose() {
    _firstnameController.dispose();
    _lastnameController.dispose();
    _loginController.dispose();
    _passwordController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  // -----------------------------------------------------------
  // UI
  // -----------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF7FD),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
              child: Text(
                'Регистрация',
                style: TextStyle(
                  color: Color(0xFF165A4A),
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildField(_lastnameController, 'Введите фамилию'),
                      const SizedBox(height: 16),
                      _buildField(_firstnameController, 'Введите имя'),
                      const SizedBox(height: 16),
                      _buildField(_ageController, 'Введите возраст',
                          keyboardType: TextInputType.number),
                      const SizedBox(height: 16),
                      _buildField(_loginController, 'Введите логин'),
                      const SizedBox(height: 16),
                      _buildField(_passwordController, 'Введите пароль',
                          obscure: true),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 24),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: registerUser,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE8F5E9),
                        foregroundColor: const Color(0xFF165A4A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                      child: const Text('Зарегистрироваться'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Есть аккаунт?',
                          style: TextStyle(color: Color(0xFF9EA3AE))),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          // Navigator.pushNamed(context, '/auth');
                        },
                        child: const Text(
                          'Войти',
                          style: TextStyle(
                            color: Color(0xFF7DCFB6),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // -----------------------------------------------------------
  // Унифицированное поле ввода
  // -----------------------------------------------------------
  Widget _buildField(TextEditingController ctrl, String hint,
      {bool obscure = false, TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      controller: ctrl,
      obscureText: obscure,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: Color(0xFF9EA3AE),
          fontSize: 16,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(
        fontSize: 16,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
      ),
    );
  }
}