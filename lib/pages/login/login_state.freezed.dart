// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$LoginState {
  String get email;
  String get password;
  User get user;

  LoginState copyWith({String email, String password, User user});
}

class _$LoginStateTearOff {
  const _$LoginStateTearOff();

  _LoginState call({String email, String password, User user}) {
    return _LoginState(
      email: email,
      password: password,
      user: user,
    );
  }
}

const $LoginState = _$LoginStateTearOff();

class _$_LoginState with DiagnosticableTreeMixin implements _LoginState {
  const _$_LoginState({this.email, this.password, this.user});

  @override
  final String email;
  @override
  final String password;
  @override
  final User user;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginState(email: $email, password: $password, user: $user)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginState'))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('user', user));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LoginState &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(user);

  @override
  _$_LoginState copyWith({
    Object email = freezed,
    Object password = freezed,
    Object user = freezed,
  }) {
    return _$_LoginState(
      email: email == freezed ? this.email : email as String,
      password: password == freezed ? this.password : password as String,
      user: user == freezed ? this.user : user as User,
    );
  }
}

abstract class _LoginState implements LoginState {
  const factory _LoginState({String email, String password, User user}) =
      _$_LoginState;

  @override
  String get email;
  @override
  String get password;
  @override
  User get user;

  @override
  _LoginState copyWith({String email, String password, User user});
}
