import 'package:dartz/dartz.dart';
import 'package:road_side/domain/auth/auth_failure.dart';
import 'package:road_side/domain/auth/credential.dart';
import 'package:road_side/domain/auth/token.dart';
import 'package:road_side/domain/auth/user.dart';
import 'package:road_side/domain/auth/value_objects.dart';

abstract class IAuthFacade {
  Future<Option<User>> getSignedInUser();
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(Credential credential);
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
  Future<void> signOut(Token token);

}
