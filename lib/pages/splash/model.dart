import 'package:flutter/cupertino.dart';

class Model {
  Model(this.context) : assert(context != null) {
    initialize();
  }

  final BuildContext context;

  void initialize() {}
}
