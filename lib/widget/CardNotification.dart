import 'package:flutter/material.dart';
import 'package:gluvi/pages/NotificationPage.dart';

class CardNotification extends StatelessWidget{
  final String title;
  final String time;
  final String status;



  const CardNotification({
    required this.title,
    required this.time,
    required this.status,
    super.key,
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFF1F2A17),
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
               child: Container(
                 width: 12,
                 height: 12,
                 decoration: BoxDecoration(
                   color: Color(int.parse('0xFF$status')),
                   shape: BoxShape.circle,
                 ),
               ),
              )
            ],
          ),
          Align(
            child: Text(
              time,
              style: TextStyle(
                color: Color(0xFF9EA3AE),
                fontSize: 12,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
              ),
            ),
            alignment: Alignment.centerRight,
          ),
          Container(
            height: 1,
            width: double.infinity,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color(0xFF1F2A17),
            ),
          )
        ],
      ),
    );
  }

}