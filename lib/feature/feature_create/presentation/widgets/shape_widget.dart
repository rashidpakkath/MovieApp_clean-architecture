import 'package:flutter/material.dart';

class ShapeCustomWiddget extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
  Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    Path path_0 = Path();
    path_0.moveTo(0,size.height*0.1550000);
    path_0.quadraticBezierTo(size.width*-0.0080000,size.height*0.0113000,size.width*0.1666667,size.height*-0.0025000);
    path_0.quadraticBezierTo(size.width*0.4193000,size.height*-0.0021750,size.width*1.0066667,size.height*0.3650000);
    path_0.quadraticBezierTo(size.width*1.0000167,size.height*0.7334937,size.width*0.9978000,size.height*0.8563250);
    path_0.quadraticBezierTo(size.width*0.9974333,size.height*1.0146750,size.width*0.8366667,size.height*0.9975000);
    path_0.lineTo(size.width*0.1666667,size.height);
    path_0.quadraticBezierTo(size.width*0.0037000,size.height*1.0109500,size.width*-0.0033333,size.height*0.8550000);
    path_0.quadraticBezierTo(size.width*-0.0025000,size.height*0.6800000,0,size.height*0.1550000);
    path_0.close();
    canvas.drawPath(path_0, paint_fill_0);
  Paint paint_stroke_0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    canvas.drawPath(path_0, paint_stroke_0);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
