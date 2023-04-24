import 'package:flutter/material.dart';

class Ui {

  static BoxDecoration getBoxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 5)),
      ],
    );
  }

  static BoxDecoration getBoxDecorationRound() {
    return BoxDecoration(
      color: Colors.blue,
      borderRadius: const BorderRadius.all(Radius.circular(50)),
    );
  }

}