import 'dart:ui';

double _width = window.physicalSize.width / window.devicePixelRatio;
double _height = window.physicalSize.height / window.devicePixelRatio;

double getWidth(double px) {
  return px * (_width / 360);
}


double getFontSize(double px) {
  return (_width / 360) > 1.5 ? px * 1.5 : px * (_width / 360);
}


double getHeight(double px) {
  return px * (_height / 759);
}



