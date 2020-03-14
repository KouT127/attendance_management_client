// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$User {
  String get uid;
  String get email;
  String get displayName;
  String get photoUrl;
  bool get isEmailVerified;
  Future<IdTokenResult> Function({bool refresh}) get getIdToken;

  User copyWith(
      {String uid,
      String email,
      String displayName,
      String photoUrl,
      bool isEmailVerified,
      Future<IdTokenResult> Function({bool refresh}) getIdToken});
}

class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {String uid,
      String email,
      String displayName,
      String photoUrl,
      bool isEmailVerified,
      Future<IdTokenResult> Function({bool refresh}) getIdToken}) {
    return _User(
      uid: uid,
      email: email,
      displayName: displayName,
      photoUrl: photoUrl,
      isEmailVerified: isEmailVerified,
      getIdToken: getIdToken,
    );
  }
}

const $User = _$UserTearOff();

class _$_User with DiagnosticableTreeMixin implements _User {
  const _$_User(
      {this.uid,
      this.email,
      this.displayName,
      this.photoUrl,
      this.isEmailVerified,
      this.getIdToken});

  @override
  final String uid;
  @override
  final String email;
  @override
  final String displayName;
  @override
  final String photoUrl;
  @override
  final bool isEmailVerified;
  @override
  final Future<IdTokenResult> Function({bool refresh}) getIdToken;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'User(uid: $uid, email: $email, displayName: $displayName, photoUrl: $photoUrl, isEmailVerified: $isEmailVerified, getIdToken: $getIdToken)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'User'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('displayName', displayName))
      ..add(DiagnosticsProperty('photoUrl', photoUrl))
      ..add(DiagnosticsProperty('isEmailVerified', isEmailVerified))
      ..add(DiagnosticsProperty('getIdToken', getIdToken));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.photoUrl, photoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.photoUrl, photoUrl)) &&
            (identical(other.isEmailVerified, isEmailVerified) ||
                const DeepCollectionEquality()
                    .equals(other.isEmailVerified, isEmailVerified)) &&
            (identical(other.getIdToken, getIdToken) ||
                const DeepCollectionEquality()
                    .equals(other.getIdToken, getIdToken)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(photoUrl) ^
      const DeepCollectionEquality().hash(isEmailVerified) ^
      const DeepCollectionEquality().hash(getIdToken);

  @override
  _$_User copyWith({
    Object uid = freezed,
    Object email = freezed,
    Object displayName = freezed,
    Object photoUrl = freezed,
    Object isEmailVerified = freezed,
    Object getIdToken = freezed,
  }) {
    return _$_User(
      uid: uid == freezed ? this.uid : uid as String,
      email: email == freezed ? this.email : email as String,
      displayName:
          displayName == freezed ? this.displayName : displayName as String,
      photoUrl: photoUrl == freezed ? this.photoUrl : photoUrl as String,
      isEmailVerified: isEmailVerified == freezed
          ? this.isEmailVerified
          : isEmailVerified as bool,
      getIdToken: getIdToken == freezed
          ? this.getIdToken
          : getIdToken as Future<IdTokenResult> Function({bool refresh}),
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {String uid,
      String email,
      String displayName,
      String photoUrl,
      bool isEmailVerified,
      Future<IdTokenResult> Function({bool refresh}) getIdToken}) = _$_User;

  @override
  String get uid;
  @override
  String get email;
  @override
  String get displayName;
  @override
  String get photoUrl;
  @override
  bool get isEmailVerified;
  @override
  Future<IdTokenResult> Function({bool refresh}) get getIdToken;

  @override
  _User copyWith(
      {String uid,
      String email,
      String displayName,
      String photoUrl,
      bool isEmailVerified,
      Future<IdTokenResult> Function({bool refresh}) getIdToken});
}
