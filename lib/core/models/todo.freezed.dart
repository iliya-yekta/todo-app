// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Todo {

 String? get description; bool get isCompleted; String get name;
/// Create a copy of Todo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoCopyWith<Todo> get copyWith => _$TodoCopyWithImpl<Todo>(this as Todo, _$identity);

  /// Serializes this Todo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Todo;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Todo&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.isCompleted, _this.isCompleted) || other.isCompleted == _this.isCompleted)&&(identical(other.name, _this.name) || other.name == _this.name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Todo;
  return Object.hash(runtimeType,_this.id,_this.createdAt,_this.description,_this.isCompleted,_this.name);
}

@override
String toString() {
  final _this = this as Todo;
  return 'Todo(id: ${_this.id}, createdAt: ${_this.createdAt}, description: ${_this.description}, isCompleted: ${_this.isCompleted}, name: ${_this.name})';
}


}

/// @nodoc
abstract mixin class $TodoCopyWith<$Res>  {
  factory $TodoCopyWith(Todo value, $Res Function(Todo) _then) = _$TodoCopyWithImpl;
@useResult
$Res call({
 String? id, String? createdAt, String? description, bool isCompleted, String name
});




}
/// @nodoc
class _$TodoCopyWithImpl<$Res>
    implements $TodoCopyWith<$Res> {
  _$TodoCopyWithImpl(this._self, this._then);

  final Todo _self;
  final $Res Function(Todo) _then;

/// Create a copy of Todo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? createdAt = freezed,Object? description = freezed,Object? isCompleted = null,Object? name = null,}) {
  return _then(Todo(
id: freezed == id ? _self.id! : id // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt! : createdAt // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Todo].
extension TodoPatterns on Todo {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Todo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Todo() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Todo value)  $default,){
final _that = this;
switch (_that) {
case _Todo():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Todo value)?  $default,){
final _that = this;
switch (_that) {
case _Todo() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? createdAt,  String? description,  bool isCompleted,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Todo() when $default != null:
return $default(_that.id,_that.createdAt,_that.description,_that.isCompleted,_that.name);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? createdAt,  String? description,  bool isCompleted,  String name)  $default,) {final _that = this;
switch (_that) {
case _Todo():
return $default(_that.id,_that.createdAt,_that.description,_that.isCompleted,_that.name);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? createdAt,  String? description,  bool isCompleted,  String name)?  $default,) {final _that = this;
switch (_that) {
case _Todo() when $default != null:
return $default(_that.id,_that.createdAt,_that.description,_that.isCompleted,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Todo extends Todo {
   _Todo({ String? id,  String? createdAt, this.description = 'No Description', this.isCompleted = false, required this.name}): super._(id: id, createdAt: createdAt);
  factory _Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

@override@JsonKey() final  String? description;
@override@JsonKey() final  bool isCompleted;
@override final  String name;

/// Create a copy of Todo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodoCopyWith<_Todo> get copyWith => __$TodoCopyWithImpl<_Todo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TodoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Todo&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.description, description) || other.description == description)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,createdAt,description,isCompleted,name);
}

@override
String toString() {
    return 'Todo(id: $id, createdAt: $createdAt, description: $description, isCompleted: $isCompleted, name: $name)';
}


}

/// @nodoc
abstract mixin class _$TodoCopyWith<$Res> implements $TodoCopyWith<$Res> {
  factory _$TodoCopyWith(_Todo value, $Res Function(_Todo) _then) = __$TodoCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? createdAt, String? description, bool isCompleted, String name
});




}
/// @nodoc
class __$TodoCopyWithImpl<$Res>
    implements _$TodoCopyWith<$Res> {
  __$TodoCopyWithImpl(this._self, this._then);

  final _Todo _self;
  final $Res Function(_Todo) _then;

/// Create a copy of Todo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? createdAt = freezed,Object? description = freezed,Object? isCompleted = null,Object? name = null,}) {
  return _then(_Todo(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
