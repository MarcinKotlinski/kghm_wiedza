import 'package:authentication_repository/authentication_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

import '../l10n/l10n.dart';
import '../theme/theme.dart';
import 'app_router.dart';

class App extends StatefulWidget {
  const App({
    super.key,
    required this.appRouter,
    required this.connectivity,
  });

  final AppRouter appRouter;
  final Connectivity connectivity;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AuthenticationRepository _authenticationRepository;
  late final UserRepository _userRepository;

  @override
  void initState() {
    _authenticationRepository = AuthenticationRepository();
    _userRepository = UserRepository();
    super.initState();
  }

  @override
  void dispose() {
    _authenticationRepository.dispose();
    super.dispose();
  }

  //todo implement InternetBloc
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: _authenticationRepository,
          userRepository: _userRepository,
        ),
        child: AppView(
          appRouter: widget.appRouter,
          connectivity: widget.connectivity,
        ),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({
    super.key,
    required this.connectivity, required this.appRouter,
  });

  final Connectivity connectivity;
  final AppRouter appRouter;


  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                widget.appRouter.router.go('/home');
                break;
              case AuthenticationStatus.unauthenticated:
                widget.appRouter.router.go('/');
                break;
              case AuthenticationStatus.unknown:
                break;
            }
          },
          child: child,
        );
      },
      theme: FlutterSmartKampusTheme.light,
      darkTheme: FlutterSmartKampusTheme.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: widget.appRouter.router,
    );
  }
}
