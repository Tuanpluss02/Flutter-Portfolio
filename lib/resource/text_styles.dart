import 'package:flutter/material.dart';

import 'app_colors.dart';

class TxtStyle {
  TextStyle neonText = TextStyle(color: AppColors().neonColor, fontSize: 14);

  TextStyle boldBlack(BuildContext context) =>
      const TextStyle(color: Colors.black, fontWeight: FontWeight.bold);

  TextStyle boldWhite(BuildContext context) =>
      const TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
}
