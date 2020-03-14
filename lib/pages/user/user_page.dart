import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key key}) : super(key: key);

  static String routeName = '/user';

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.primary,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: FractionallySizedBox(
              widthFactor: .9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 20),
                  buildImageBox(context),
                  const SizedBox(height: 10),
                  Text(
                    'kou 127',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          UserSettingButton(
                            title: 'Logout',
                            buttonPosition: ButtonPosition.top,
                            onTap: () {},
                          ),
                          UserSettingButton(
                            title: '',
                          ),
                          UserSettingButton(
                            title: '',
                          ),
                          UserSettingButton(
                            title: '',
                            buttonPosition: ButtonPosition.bottom,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImageBox(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        height: 55,
        width: 55,
        child: ColoredBox(
          color: Theme.of(context).accentColor,
          child: Icon(
            Icons.account_circle,
            size: 55,
          ),
        ),
      ),
    );
  }
}

enum ButtonPosition {
  top,
  center,
  bottom,
}

extension ButtonPositionEx on ButtonPosition {
  borderRadius() {
    switch (this) {
      case ButtonPosition.top:
        return const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        );
      case ButtonPosition.bottom:
        return const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        );
      default:
        return const BorderRadius.only();
    }
  }
}

class UserSettingButton extends StatelessWidget {
  const UserSettingButton({
    Key key,
    this.buttonPosition,
    this.title,
    this.onTap,
  }) : super(key: key);

  final ButtonPosition buttonPosition;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: buttonPosition.borderRadius(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 23,
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
