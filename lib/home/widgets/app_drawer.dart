import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_repository/home_repository.dart';

import '../../authentication/bloc/authentication_bloc.dart';
import '../../login/bloc/login_bloc.dart';
import '../bloc/home_bloc.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return LoginBloc(
              authenticationRepository:
                  RepositoryProvider.of<AuthenticationRepository>(context),
            );
          },
        ),
        BlocProvider(
          create: (context) => HomeBloc(homeRepository: HomeRepository())
            ..add(MenuItemFetched()),
        ),
      ],
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
                      // currentAccountPicture: CircleAvatar(
                      //   child: ClipOval(
                      //     child: Image.network(
                      //       picture,
                      //       fit: BoxFit.cover,
                      //       width: 90,
                      //       height: 90,
                      //     ),
                      //   ),
                      // ),
                    );
                  },
                ),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: state.menuItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SwitchListTile(
                          title: Text(state.menuItems[index].name),
                          value: state.menuItems[index].isActive,
                          onChanged: (bool? value) {
                            setState(() {
                              state.menuItems[index].isActive = value!;
                              context.read<HomeBloc>()
                                ..add(MenuItemChanged(state.menuItems[index].id,
                                    value));
                            });
                          },
                        );
                      },
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
