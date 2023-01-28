import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:home_repository/home_repository.dart';

import '../bloc/home_bloc.dart';
import '../widgets/app_drawer.dart';
import '../widgets/menu_page_grid.dart';

class ChoicePage extends StatefulWidget {
  const ChoicePage({Key? key}) : super(key: key);

  @override
  State<ChoicePage> createState() => _ChoicePageState();
}

class _ChoicePageState extends State<ChoicePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      HomeBloc(homeRepository: HomeRepository())
        ..add(MenuItemFetched()),
      child: Scaffold(
        drawer: const AppDrawer(),
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .scaffoldBackgroundColor,
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
        body: Column(
          children: [
            Flexible(
              flex: 2,
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
                            "Tematy",
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
                              "Wybierz interesuace Cię tematy",
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
            Flexible(
              flex: 5,
              child: BlocProvider(
                create: (context) => HomeBloc(homeRepository: HomeRepository())..add(MenuItemFetched()),
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: state.menuItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SwitchListTile(
                              title: Text(state.menuItems[index].name),
                              value: state.menuItems[index].isActive,
                              onChanged: (bool? value) {
                                setState(() {
                                  state.menuItems[index].isActive = value!;
                                  context.read<HomeBloc>()
                                    ..add(
                                        MenuItemChanged(state.menuItems[index].id,
                                            value));
                                });
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
            ElevatedButton(
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
            "Dalej",
            style: TextStyle(fontSize: 16),
          ),
        ),
        onPressed: () {
          context.go('/home');
        },
      ),
              ],
            ))
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
