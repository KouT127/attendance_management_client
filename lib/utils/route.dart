import 'package:flutter/widgets.dart';

class FadeRoute extends PageRouteBuilder {
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
