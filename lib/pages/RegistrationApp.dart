import 'package:flutter/material.dart';

class RegistrationApp extends StatefulWidget {
  _RegistrationAppState createState() => _RegistrationAppState();
}

class _RegistrationAppState extends State<RegistrationApp>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children:[
          Padding(
            padding: EdgeInsetsGeometry.fromLTRB(16, 52, 0, 0),
            child: Text('Регистрация', style:
            TextStyle(
              color: Color.fromRGBO(22, 90, 74, 100),
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            ),
          ),
          Padding(padding: EdgeInsetsGeometry.all(32),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                      hintText: 'Введите логин',
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32)))
                  ),
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Введите пароль',
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32))),
                  ),
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),


          ElevatedButton(onPressed: (){

          }, child: Text('Зарегистрироваться')),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [Text('Есть аккаунт?', style: TextStyle(color: Color(0xFF9EA3AE)),),
              GestureDetector(onTap: (){
Navigator.pushNamed(context, '/auth');
              },
                child: Text('Войти', style: TextStyle(color: Color(0xFF7DCFB6)),)
              )
            ]
          )
        ],)

    );
  }
}
