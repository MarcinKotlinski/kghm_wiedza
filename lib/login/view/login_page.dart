import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: SizedBox(
          height: 100,
          width: 100,
          child: Image.asset(
            'lib/assets/icons/kghm.png',
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Flexible(
                          child: Text(
                            "Logowanie",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 52,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 20.0),
                            child: Text(
                              "Zaloguj się do aplikacji",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Material(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              color: Colors.white,
              elevation: 5,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: BlocProvider(
                                    create: (context) {
                                      return LoginBloc(
                                        authenticationRepository:
                                        RepositoryProvider.of<
                                            AuthenticationRepository>(
                                            context),
                                      );
                                    },
                                    child: BlocBuilder<LoginBloc, LoginState>(
                                      buildWhen: (previous, current) => previous.status != current.status,
                                      builder: (context, state) {
                                        return state.status.isSubmissionInProgress
                                            ? const CircularProgressIndicator()
                                            : ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            foregroundColor: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ).copyWith(
                                              elevation:
                                              ButtonStyleButton.allOrNull(
                                                  0.0)),
                                          child: const Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: Text(
                                              "Logowanie/Rejestracja",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                          onPressed: () {
                                            context.read<LoginBloc>().add(const LoginRequested());
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
