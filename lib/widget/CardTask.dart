import 'package:flutter/material.dart';
import 'package:gluvi/pages/DiaryPage.dart';

class CardTask extends StatelessWidget{

  final String title;
  final String time;
  final String character;
  final String desc;

  const CardTask({
    required this.title,
    required this.time,
    required this.character,
    required this.desc,
    super.key,
});




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: CustomPaint(
          painter: CustomTasks(),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                            color: Color(0xFF1F2A17),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 16
                        ),
                      ),
                    ),
                    Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            time,
                            style: TextStyle(
                                color: Color(0xFF60616A),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400,
                                fontSize: 12
                            ),
                          ),
                        )
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  character,
                  style: TextStyle(
                      color: Color(0xFF1F2A17),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      fontSize: 12
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  desc,
                  style: TextStyle(
                      color: Color(0xFF1F2A17),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      fontSize: 12
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}