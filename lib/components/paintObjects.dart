import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    var paintTwo = Paint();
    paint.color=Colors.orange[400].withOpacity(.3);
    paint.style=PaintingStyle.fill;

    paintTwo.color=Colors.orange[600].withOpacity(.2);
    paintTwo.style=PaintingStyle.fill;
       
    canvas.drawCircle(Offset(3,6), 400, paint);
    canvas.drawCircle(Offset(2,4), 300, paintTwo);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
