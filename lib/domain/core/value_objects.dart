import 'package:dartz/dartz.dart';
import 'package:road_side/domain/core/errors.dart';
import 'failures.dart';

abstract class ValueObject<T>{
  const ValueObject();

  Either<ValueFailure<T>, T> get value;

  T getOrCrash(){
    return value.fold((f) => throw UnExpectedValueError(f), (r)=>r);
  }

  bool isValid() => value.isRight();


  @override
  bool operator == (Object o){
    if (identical(this, o)) return true;

    return o is ValueObject<T> &&
        o.value == value;
  }

  @override
  int get hashCode => value.hashCode.hashCode;

  @override
  String toString() => 'Value - $value';

}