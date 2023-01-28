import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kghm_wiedza/utils/url_launch.dart';

class MenuPageGridItem extends StatelessWidget {
  const MenuPageGridItem({
    required this.label,
    required this.icon,
    required this.webSite,
    super.key,
  });

  final String label;
  final String icon;
  final String webSite;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 4,
          clipBehavior: Clip.antiAlias,
          // color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(icon),
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.bottomCenter,
                    ),
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Center(
                      child: Text(
                        label,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Material(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            color: Colors.transparent,
            child: InkWell(
              onTap: () => {
                UrlLaunch.openWebSite(webSite),
              },
            ),
          ),
        ),
      ],
    );
  }
}
