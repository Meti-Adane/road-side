import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:road_side/domain/auth/auth_failure.dart';
import 'package:road_side/domain/auth/credential.dart';
import 'package:road_side/domain/auth/i_auth_facade.dart';
import 'package:road_side/domain/auth/value_objects.dart';
import 'package:road_side/domain/core/value_validators.dart';


part 'register_form_event.dart';
part 'register_form_state.dart';
part 'register_form_bloc.freezed.dart';

class RegisterFormBloc extends Bloc<RegisterFormEvent, RegisterFormState> {
  final IAuthFacade _authFacade;

  RegisterFormBloc(this._authFacade) : super(RegisterFormState.initial());

  @override
  Stream<RegisterFormState> mapEventToState(
    RegisterFormEvent event,
  ) async* {
    yield* event.map(
      nameChanged: (e) async* {
        yield state.copyWith(
          name: e.nameStr,
          authFailureOrSuccessOption: none(),
        );
      },
      emailChanged: (e) async* {
        yield state.copyWith(
          emailAddress: EmailAddress(e.emailStr),
          authFailureOrSuccessOption: none(),
        );
      },
      passwordChanged: (e) async* {
        yield state.copyWith(
          password: Password(e.passwordStr),
          authFailureOrSuccessOption: none(),
        );
      },
      confirmPasswordChanged: (e) async*{
        yield state.copyWith(
          password: Password(e.changedPasswordStr),
          authFailureOrSuccessOption: none(),
        );
      },
      registerWithEmailAndPasswordPressed: (e) async* {
        final credential = Credential(
            emailAddress: state.emailAddress,
            password: state.password,
            type: AuthType.email,
            name: state.name
        );
        yield* _performActionOnAuthFacadeWithEmailAndPassword(
          _authFacade.registerWithEmailAndPassword, credential
        );
      },
    );
  }

  Stream<RegisterFormState> _performActionOnAuthFacadeWithEmailAndPassword(
      Future<Either<AuthFailure, Unit>> Function(
          Credential credential)
      forwardedCall, Credential credential
      ) async* {
    late Either<AuthFailure, Unit> failureOrSuccess;


    final isEmailValid = credential.emailAddress.isValid();
    final isPasswordValid = credential.password.isValid();
    final isConfirmValid = validateConfirmPassword(credential.password.toString(), state.confirmPassword.toString()).isRight() ? true : false;

    if (isEmailValid && isPasswordValid && isConfirmValid) {
      yield state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      );

      failureOrSuccess = await forwardedCall(credential);

    }
    yield state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      // optionOf is equivalent to:
      // authFailureOrSuccessOption:failureOrSuccess == null ? none() : some(failureOrSuccess)
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    );
  }
}
