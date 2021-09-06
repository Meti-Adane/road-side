import 'package:dartz/dartz.dart';
import 'package:road_side/domain/auth/auth_failure.dart';
import 'package:road_side/models/register_credential/RegisterCredential.dart';
import 'package:road_side/models/user/UserModel.dart';
import 'package:road_side/domain/auth/value_objects.dart';

abstract class IAuthFacade {
  Future<Option<User>> getSignedInUser();
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(RegisterCredential credential);
  Future<Either<AuthFailure, Unit>> signInWithUsernameAndPassword({
    required Username username,
    required Password password,
  });
  Future<void> signOut(String token);

}
