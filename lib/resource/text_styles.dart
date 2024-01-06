import 'package:flutter/material.dart';

import 'app_colors.dart';

class TxtStyle {
  var neonText = TextStyle(color: AppColors().neonColor, fontSize: 14);

  boldBlack(context) =>
      const TextStyle(color: Colors.black, fontWeight: FontWeight.bold);

  boldWhite(context) =>
      const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
}
