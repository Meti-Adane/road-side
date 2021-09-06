import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:injectable/injectable.dart';
import 'package:road_side/domain/auth/i_auth_facade.dart';
import 'package:road_side/domain/auth/value_objects.dart';
import 'package:road_side/domain/auth/auth_failure.dart';

part 'sign_in_form_event.dart';

part 'sign_in_form_state.dart';

part 'sign_in_form_bloc.freezed.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade) : super(SignInFormState.initial());

  @override
  SignInFormState get initialState => SignInFormState.initial();

  @override
  Stream<SignInFormState> mapEventToState(
    SignInFormEvent event,
  ) async* {
    yield* event.map(
      signInWithUsernameAndPasswordPressed: (e) async* {
        //TODO - directly send credential to api
        yield* _performActionOnAuthFacadeWithUsernameAndPassword(
             _authFacade.signInWithUsernameAndPassword
         );
      },
    );
  }

  Stream<SignInFormState> _performActionOnAuthFacadeWithUsernameAndPassword(
    Future<Either<AuthFailure, Unit>> Function(
      {required Username username, required Password password}
    ) forwardedCall, 
  )async*{
    late Either<AuthFailure, Unit> failureOrSuccess;
    
    yield state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      );
    failureOrSuccess = await forwardedCall(
          username: state.username, password: state.password);
    
     yield state.copyWith(
      isSubmitting: false,
      showErrorMessages: true,
      // optionOf is equivalent to:
      // authFailureOrSuccessOption:failureOrSuccess == null ? none() : some(failureOrSuccess)
      authFailureOrSuccessOption: optionOf(failureOrSuccess),
    );
  }

}


