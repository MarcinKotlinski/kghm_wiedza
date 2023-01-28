import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../authentication/bloc/authentication_bloc.dart';
import '../../login/bloc/login_bloc.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return LoginBloc(
          authenticationRepository:
          RepositoryProvider.of<AuthenticationRepository>(context),
        );
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Drawer(
            child: ListView(
              // Remove padding
              padding: EdgeInsets.zero,
              children: [
                Builder(
                  builder: (context) {
                    final name = context.select(
                          (AuthenticationBloc bloc) => bloc.state.user.name,
                    );
                    final picture = context.select(
                          (AuthenticationBloc bloc) => bloc.state.user.picture,
                    );
                    return UserAccountsDrawerHeader(
                      accountName: Text(''),
                      accountEmail: Text("$name"),
                      currentAccountPicture: CircleAvatar(
                        child: ClipOval(
                          child: Image.network(
                            picture,
                            fit: BoxFit.cover,
                            width: 90,
                            height: 90,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Wyloguj'),
                  leading: const Icon(Icons.exit_to_app),
                  onTap: () =>
                  {context.read<LoginBloc>().add(const LogoutRequested())},
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
