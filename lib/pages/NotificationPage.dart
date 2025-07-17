import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
backgroundColor: Color(0xFF2C6975),
      body: Column(
        children: [
          Row(
            children: [
              Text('Уведомления', style: TextStyle(fontSize: 24, fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),),
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: Image.asset('assets/sort_icon.png')),
                  IconButton(onPressed: () {}, icon: Image.asset('assets/filter_icon.png')),
                ],
              )
            ],
          ),
          Text('Сегодня', style: TextStyle(fontSize: 20, fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)),),
        ],
      ),
    );
  }
}