import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShadowBox extends StatelessWidget {
  const ShadowBox({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            15,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            spreadRadius: 1.0,
            offset: const Offset(
              2.0,
              2.0,
            ),
          )
        ],
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.white70,
          ],
        ),
      ),
      child: child,
    );
  }
}
