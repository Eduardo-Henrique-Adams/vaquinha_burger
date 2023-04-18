import 'dart:ui';

import 'package:flutter/cupertino.dart';

class ColorsApp {
  static ColorsApp? _intance;

  ColorsApp._();

  static ColorsApp get i {
    _intance ??= ColorsApp._();
    return _intance!;
  }

  Color get primary => const Color(0XFF007D21);
  Color get secondary => const Color(0XFFF88B0C);
}

extension ColorsAppExcetions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}
