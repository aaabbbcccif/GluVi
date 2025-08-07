import 'package:flutter/material.dart';
import 'package:gluvi/widget/CardTask.dart';

class DiaryPage extends StatefulWidget {
  @override
  _DiaryPageState createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  final titleTask = 'Завтрак';
  final timeTask = '08:30';
  final characterTask = 'Сахар: 6.8 ммоль/л \nИнсулин: 6 Ед (Хумалог)';
  final descTask = 'Чувствую себя нормально, лёгкая сонливость...';

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
          SingleChildScrollView(
            child: Column(
              children: [
                CardTask(
                  title: 'Завтрак',
                  time: '08:30',
                  character: 'Сахар: 6.8 ммоль/л \nИнсулин: 6 Ед (Хумалог)',
                  desc: 'Чувствую себя нормально, лёгкая сонливость...',
                ),
                CardTask(
                  title: 'Обед',
                  time: '13:00',
                  character: 'Сахар: 7.2 ммоль/л \nИнсулин: 7 Ед (Хумалог)',
                  desc: 'После еды немного кружится голова...',
                ),
                CardTask(
                  title: 'Завтрак',
                  time: '08:30',
                  character: 'Сахар: 6.8 ммоль/л \nИнсулин: 6 Ед (Хумалог)',
                  desc: 'Чувствую себя нормально, лёгкая сонливость...',
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTasks extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size){

    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final borderRadius = 20.0;
    final verticalPadding = 24.0;

    final rect = RRect.fromRectAndRadius(
      Rect.fromLTRB(
          0,
          verticalPadding,
          size.width,
          size.height-verticalPadding
      ),
      Radius.circular(borderRadius),
    );

    canvas.drawRRect(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
