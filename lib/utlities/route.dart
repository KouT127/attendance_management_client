import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FadeRoute<T> extends PageRouteBuilder<T> {
  FadeRoute({
    @required this.builder,
  }) : super(pageBuilder: (context, _, __) => builder(context));

  final WidgetBuilder builder;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}

class OverlaySlideUpRoute extends ModalRoute<void> {
  OverlaySlideUpRoute({
    this.child,
  });

  final Widget child;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => false;

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration => Duration(milliseconds: 400);

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return _buildOverlayContent(context);
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    final tween = Tween(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    );
    final curve = CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    );
    return SlideTransition(
      position: tween.animate(curve),
      child: child,
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    return this.child;
  }
}
