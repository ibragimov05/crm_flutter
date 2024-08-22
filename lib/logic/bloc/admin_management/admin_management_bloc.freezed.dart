// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_management_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AdminManagementEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAllUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllUsers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllUsersEvent value) getAllUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetAllUsersEvent value)? getAllUsers,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllUsersEvent value)? getAllUsers,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminManagementEventCopyWith<$Res> {
  factory $AdminManagementEventCopyWith(AdminManagementEvent value,
          $Res Function(AdminManagementEvent) then) =
      _$AdminManagementEventCopyWithImpl<$Res, AdminManagementEvent>;
}

/// @nodoc
class _$AdminManagementEventCopyWithImpl<$Res,
        $Val extends AdminManagementEvent>
    implements $AdminManagementEventCopyWith<$Res> {
  _$AdminManagementEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminManagementEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetAllUsersEventImplCopyWith<$Res> {
  factory _$$GetAllUsersEventImplCopyWith(_$GetAllUsersEventImpl value,
          $Res Function(_$GetAllUsersEventImpl) then) =
      __$$GetAllUsersEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllUsersEventImplCopyWithImpl<$Res>
    extends _$AdminManagementEventCopyWithImpl<$Res, _$GetAllUsersEventImpl>
    implements _$$GetAllUsersEventImplCopyWith<$Res> {
  __$$GetAllUsersEventImplCopyWithImpl(_$GetAllUsersEventImpl _value,
      $Res Function(_$GetAllUsersEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminManagementEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetAllUsersEventImpl implements GetAllUsersEvent {
  const _$GetAllUsersEventImpl();

  @override
  String toString() {
    return 'AdminManagementEvent.getAllUsers()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAllUsersEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getAllUsers,
  }) {
    return getAllUsers();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getAllUsers,
  }) {
    return getAllUsers?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getAllUsers,
    required TResult orElse(),
  }) {
    if (getAllUsers != null) {
      return getAllUsers();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllUsersEvent value) getAllUsers,
  }) {
    return getAllUsers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetAllUsersEvent value)? getAllUsers,
  }) {
    return getAllUsers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllUsersEvent value)? getAllUsers,
    required TResult orElse(),
  }) {
    if (getAllUsers != null) {
      return getAllUsers(this);
    }
    return orElse();
  }
}

abstract class GetAllUsersEvent implements AdminManagementEvent {
  const factory GetAllUsersEvent() = _$GetAllUsersEventImpl;
}

/// @nodoc
mixin _$AdminManagementState {
  List<User>? get users => throw _privateConstructorUsedError;
  AdminManagementStatus get adminManagementStatus =>
      throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of AdminManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AdminManagementStateCopyWith<AdminManagementState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminManagementStateCopyWith<$Res> {
  factory $AdminManagementStateCopyWith(AdminManagementState value,
          $Res Function(AdminManagementState) then) =
      _$AdminManagementStateCopyWithImpl<$Res, AdminManagementState>;
  @useResult
  $Res call(
      {List<User>? users,
      AdminManagementStatus adminManagementStatus,
      String? error});
}

/// @nodoc
class _$AdminManagementStateCopyWithImpl<$Res,
        $Val extends AdminManagementState>
    implements $AdminManagementStateCopyWith<$Res> {
  _$AdminManagementStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdminManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = freezed,
    Object? adminManagementStatus = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      adminManagementStatus: null == adminManagementStatus
          ? _value.adminManagementStatus
          : adminManagementStatus // ignore: cast_nullable_to_non_nullable
              as AdminManagementStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminManagementStateImplCopyWith<$Res>
    implements $AdminManagementStateCopyWith<$Res> {
  factory _$$AdminManagementStateImplCopyWith(_$AdminManagementStateImpl value,
          $Res Function(_$AdminManagementStateImpl) then) =
      __$$AdminManagementStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<User>? users,
      AdminManagementStatus adminManagementStatus,
      String? error});
}

/// @nodoc
class __$$AdminManagementStateImplCopyWithImpl<$Res>
    extends _$AdminManagementStateCopyWithImpl<$Res, _$AdminManagementStateImpl>
    implements _$$AdminManagementStateImplCopyWith<$Res> {
  __$$AdminManagementStateImplCopyWithImpl(_$AdminManagementStateImpl _value,
      $Res Function(_$AdminManagementStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AdminManagementState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? users = freezed,
    Object? adminManagementStatus = null,
    Object? error = freezed,
  }) {
    return _then(_$AdminManagementStateImpl(
      users: freezed == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>?,
      adminManagementStatus: null == adminManagementStatus
          ? _value.adminManagementStatus
          : adminManagementStatus // ignore: cast_nullable_to_non_nullable
              as AdminManagementStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AdminManagementStateImpl implements _AdminManagementState {
  const _$AdminManagementStateImpl(
      {final List<User>? users,
      this.adminManagementStatus = AdminManagementStatus.initial,
      this.error})
      : _users = users;

  final List<User>? _users;
  @override
  List<User>? get users {
    final value = _users;
    if (value == null) return null;
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final AdminManagementStatus adminManagementStatus;
  @override
  final String? error;

  @override
  String toString() {
    return 'AdminManagementState(users: $users, adminManagementStatus: $adminManagementStatus, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminManagementStateImpl &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.adminManagementStatus, adminManagementStatus) ||
                other.adminManagementStatus == adminManagementStatus) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_users),
      adminManagementStatus,
      error);

  /// Create a copy of AdminManagementState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminManagementStateImplCopyWith<_$AdminManagementStateImpl>
      get copyWith =>
          __$$AdminManagementStateImplCopyWithImpl<_$AdminManagementStateImpl>(
              this, _$identity);
}

abstract class _AdminManagementState implements AdminManagementState {
  const factory _AdminManagementState(
      {final List<User>? users,
      final AdminManagementStatus adminManagementStatus,
      final String? error}) = _$AdminManagementStateImpl;

  @override
  List<User>? get users;
  @override
  AdminManagementStatus get adminManagementStatus;
  @override
  String? get error;

  /// Create a copy of AdminManagementState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdminManagementStateImplCopyWith<_$AdminManagementStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
