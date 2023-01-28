import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_repository/home_repository.dart';

import '../bloc/home_bloc.dart';
import '../widgets/app_drawer.dart';
import '../widgets/menu_page_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
      HomeBloc(homeRepository: HomeRepository())..add(MenuItemFetched()),
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
              flex: 1,
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
                            "Menu",
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
                              "Wybierz element",
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
              flex: 3,
              child: Material(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                color: Colors.white,
                elevation: 60,
                child: MenuPageGrid(),
              ),
            ),
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
