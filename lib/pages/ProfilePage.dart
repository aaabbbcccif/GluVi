import 'dart:math';

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFFFDF7FD),
      body:  SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.fromLTRB(16, 0, 16, 0), 
          child: Column(
            children: [
              Stack(
                children: [
                  // Центр круга
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 68, bottom: 16),
                      child: CustomPaint(
                        size: Size(132, 132),
                        painter: RingPainter(),
                      ),
                    ),
                  ),
  
                  // Иконка настроек в правом верхнем углу
                  Positioned(
                    top: 68,
                    right: 0,
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/icon_settings.png'),
                    ),
                  ),
                ],
              ),
  
              Text(
                  textAlign: TextAlign.center,
                  'Анна Николаевна',
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                  )
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24, 24, 0, 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      'Мои данные',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color(0xFF165A4A),
                        fontSize: 24,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      )
                  ),
                )
              ),
              CustomPaint(
                size: Size(343, 103),
                painter: RectanglePainter(), // твой кастомный прямоугольник
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Первая колонка — метки
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Дата рождения:'),
                            SizedBox(height: 8),
                            Text('Номер телефона:'),
                            SizedBox(height: 8),
                            Text('Адрес проживания:'),
                          ],
                        ),
                      ),

                      // Вторая колонка — значения
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('22.06.2006'),
                            SizedBox(height: 8),
                            Text('8 778 758 2868'),
                            SizedBox(height: 8),
                            Text('ул. Ленина 12-22'),
                          ],
                        ),
                      ),

                      // Третья колонка — кнопка
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/change.png'),
                            iconSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(24, 24, 0, 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      'Мои наблюдатели',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color(0xFF165A4A),
                        fontSize: 24,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                      )
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                      child: CustomPaint(
                        size: Size(343, 103),
                        painter: RectanglePainter(),
                        child: Row(
                          children: [
                            SizedBox(height: 10,),
                          Expanded(
                          flex: 1,
                            child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),child:
                              CircleAvatar(
                                radius: 18,
                                backgroundImage: AssetImage('assets/avatar_mother.png'),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text('Мама'),
                          ),
                        Expanded(
                          flex: 3,
                            child: Align(
                              alignment: Alignment.centerRight,
                                child: IconButton(onPressed: (){}, icon: Image.asset('assets/change.png'))
                            ),
                        ),
                            SizedBox(height: 10,),
                          ],
                        ),
                      ),
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                    child: CustomPaint(
                      size: Size(343, 103),
                      painter: RectanglePainter(),
                      child: Row(
                        children: [
                          SizedBox(height: 10,),
                          Expanded(
                            flex: 1,
                            child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),child:
                            CircleAvatar(
                              radius: 18,
                              backgroundImage: AssetImage('assets/avatar_grandmother.png'),
                            ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text('Бабушка'),
                          ),
                          Expanded(
                            flex: 3,
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(onPressed: (){}, icon: Image.asset('assets/change.png'))
                            ),
                          ),
                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                    child: CustomPaint(
                      size: Size(343, 103),
                      painter: RectanglePainter(),
                      child: Row(
                        children: [
                          SizedBox(height: 10,),
                          Expanded(
                            flex: 1,
                            child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),child:
                            CircleAvatar(
                              radius: 18,
                              backgroundImage: AssetImage('assets/avatar_darya.png'),
                            ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text('Дарья Юрьевна'),
                          ),
                          Expanded(
                            flex: 3,
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(onPressed: (){}, icon: Image.asset('assets/change.png'))
                            ),
                          ),
                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ],
          )
        )
     ,)
    );
  }
}

class RectanglePainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size){
    final double borderRadius = 10.0;
    final double borderWidht = 2.0;

    final rect = Rect.fromLTWH(borderWidht/2, borderWidht/2, size.width - borderWidht, size.height - borderWidht);

    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(borderRadius));

    final fillPainter = Paint()
      ..color = const Color(0xFFFFFDFD)
      ..style = PaintingStyle.fill;
    
    canvas.drawRRect(rrect, fillPainter);

    final borderPainter = Paint()
      ..color = const Color(0xFF7DCFB6)
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidht;

    canvas.drawRRect(rrect, borderPainter);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }


}

class RingPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size)
  {
    final center = Offset(size.width/2, size.height/2);
    final outerRadius = size.width/2;
    final innerRadius = outerRadius - 6;

    final outerPaint = Paint()
    ..shader = RadialGradient(
      colors: [Color(0xFF7DCFB6),Color(0xFF7DCFB6)],
    ).createShader(
        Rect.fromCircle(center: center, radius: outerRadius),
    )
    ..style = PaintingStyle.fill;

    final holePaint = Paint()
    ..blendMode = BlendMode.clear
    ..style = PaintingStyle.fill;
    
    canvas.drawCircle(center, outerRadius, outerPaint);
    
    canvas.drawCircle(center, innerRadius, holePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

}