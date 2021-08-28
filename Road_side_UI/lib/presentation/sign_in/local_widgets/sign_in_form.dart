import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:road_side/application/auth/sign_in_form/sign_in_form_bloc.dart';
import 'package:road_side/presentation/core/ourContainer.dart';


class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
        listener: (context, state) {
          state.authFailureOrSuccessOption.fold(
                  () {},
                  (either) => either.fold(
                      (failure) => {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: failure.map(
                            cancelledByUser: (_) => const Text('Canceled'),
                            serverError: (_) => const Text('Server Error'),
                            emailAlreadyInUse: (_) =>
                            const Text('Email Already in Use'),
                            invalidEmailAndPasswordCombination: (_) =>
                            const Text(
                                'Invalid Email and password Combination'))))
                  },
                      (_) {}));
        }, builder: (context, state) {
      return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: OurContainer(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined), hintText: "Email"),
                  autocorrect: false,
                  onChanged: (value) => context
                      .read<SignInFormBloc>()
                      .add(SignInFormEvent.emailChanged(value)),
                  validator: (_) =>
                      context.read<SignInFormBloc>().state.emailAddress.value.fold(
                            (f) => f.maybeMap(
                            invalidEmail: (_) => 'Invalid Email',
                            orElse: () => null),
                            (_) => null,
                      ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline),
                    hintText: "Full Name",
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    hintText: "Password",
                  ),
                  obscureText: true,
                  autocorrect: false,
                  onChanged: (value) => context
                      .read<SignInFormBloc>()
                      .add(SignInFormEvent.passwordChanged(value)),
                  validator: (_) =>
                      context.read<SignInFormBloc>().state.password.value.fold(
                            (f) => f.maybeMap(
                            shortPassword: (_) => 'Short Password',
                            mustContainCapital: (_) => 'Password must contain Capital Letter',
                            mustContainDigit: (_) => 'Password must contain Digit',
                            orElse: () => null),
                            (_) => null,
                      ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_open),
                    hintText: "Confirm Password",
                  ),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<SignInFormBloc>().add(
                        const SignInFormEvent
                            .signInWithEmailAndPasswordPressed(),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 90),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                    )),
              ],
            )),
      );
    });
  }
}
