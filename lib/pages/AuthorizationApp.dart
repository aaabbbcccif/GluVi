import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthorizationApp extends StatefulWidget {
  const AuthorizationApp({super.key});

  @override
  State<AuthorizationApp> createState() => _AuthorizationAppState();
}

class _AuthorizationAppState extends State<AuthorizationApp> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  // -----------------------------------------------------------
  // Отправка запроса
  // -----------------------------------------------------------
  Future<void> _login() async {
    const url = 'http://192.168.1.36:8082/api/login';

    final body = jsonEncode({
      'login': _loginController.text.trim(),
      'password': _passwordController.text.trim(),
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: body,
      ).timeout(const Duration(seconds: 5));

      if (response.statusCode == 200 && response.body == 'OK') {
        // успешно
        if (!mounted) return;
        Navigator.pushNamed(context, '/bnbar');
      } else {
        // неверные данные
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Неверный логин или пароль')),
        );
      }
    } catch (e) {
      // ошибка сети
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ошибка подключения: $e')),
      );
    }
  }

  // -----------------------------------------------------------
  // UI (ваш старый build)
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
                'Авторизация',
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
                      _field(_loginController, 'Введите логин'),
                      const SizedBox(height: 16),
                      _field(_passwordController, 'Введите пароль', obscure: true),
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
                      onPressed: _login, // <-- вызываем метод
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE8F5E9),
                        foregroundColor: const Color(0xFF165A4A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                      child: const Text('Войти'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Нет аккаунта?',
                        style: TextStyle(color: Color(0xFF9EA3AE)),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/reg');
                          },
                          child: Text('Зарегистрироваться',
                              style: TextStyle(color: Color(0xFF7DCFB6))
                          )
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // -----------------------------------------------------------
  // Унифицированное поле
  // -----------------------------------------------------------
  Widget _field(TextEditingController ctrl, String hint, {bool obscure = false}) {
    return TextField(
      controller: ctrl,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(32),
        ),
      ),
    );
  }
}