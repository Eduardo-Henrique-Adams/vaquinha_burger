import 'package:flutter/material.dart';
import 'package:vaquinha_burguer/app/dw9_delivery_app.dart';

import 'app/core/config/env/env.dart';

void main() async {
  await Env.i.load();
  runApp(Dw9DeliveryApp());
}
