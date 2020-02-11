// TODO: use abstract class
//class WrapProvider<T extends Model> extends StatelessWidget {
//  const WrapProvider({Key key, this.model, this.child}) : super(key: key);
//
//  final T model;
//  final Widget child;
//
//  @override
//  Widget build(BuildContext context) {
//    return ChangeNotifierProvider<T>(
//      create: (_) => Model.create(context),
//      child: child,
//    );
//  }
//}
