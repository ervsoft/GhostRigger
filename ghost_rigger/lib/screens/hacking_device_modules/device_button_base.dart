import 'dart:ui';
import 'package:flame/sprite.dart';

import '../hacking_device.dart';
import 'device_module_base.dart';

abstract class DeviceButtonBase extends DeviceModuleBase {
  Sprite buttonSprite;
  Sprite buttonPressedSprite;
  Paint paint;
  bool pressed;
  bool enabled;

  DeviceButtonBase(HackingDevice hackingDevice, String buttonSpriteName, String buttonPressedSpriteName)
      : super(hackingDevice) {
    buttonSprite = Sprite(buttonSpriteName);
    buttonPressedSprite = Sprite(buttonPressedSpriteName);
    paint = Paint();
    enabled = true;
    pressed = false;
  }

  @override
  void render(Canvas canvas) {
    area = getArea();
    if (pressed)
      buttonPressedSprite.renderRect(canvas, area);
    else
      buttonSprite.renderRect(canvas, area);
  }

  Rect getArea();

  @override
  void update(double t) {
    // Nothing to do here
  }

  @override
  void onTapDown(double dX, double dY) {
    if (area.contains(Offset(dX, dY)))
      pressed = true;
    else
      pressed = false;
  }

  @override
  void onTapUp(double dX, double dY) {
    pressed = false;
  }
}