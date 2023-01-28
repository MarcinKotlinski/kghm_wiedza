import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';
import 'menu_page_grid_item.dart';

class MenuPageGrid extends StatefulWidget {
  const MenuPageGrid({
    super.key,
  });

  @override
  State<MenuPageGrid> createState() => _MenuPageGridState();
}

class _MenuPageGridState extends State<MenuPageGrid> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          itemCount: state.menuItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            // mainAxisExtent: 200,
            childAspectRatio: 3/4,
          ),
          itemBuilder: (BuildContext context, int index) {
            return MenuPageGridItem(
              label: state.menuItems[index].name.toString(),
              icon: state.menuItems[index].imageAsset.toString(),
            );
          },
        );
      },
    );
  }
}
