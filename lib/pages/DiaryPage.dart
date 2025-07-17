import 'package:flutter/material.dart';

class DiaryPage extends StatefulWidget {
  @override
  _DiaryPageState createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2C6975),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // <-- ключевое изменение
              children: [
                Text(
                  'Дневник',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/search_icon.png'),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/add_icon.png'),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/download_icon.png'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Text(
              'Сегодня',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
