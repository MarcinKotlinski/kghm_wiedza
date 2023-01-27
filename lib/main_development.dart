import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:kghm_wiedza/app/app.dart';
import 'package:kghm_wiedza/bootstrap.dart';

import 'app/app_router.dart';

void main() {
  bootstrap(
        () => App(
      appRouter: AppRouter(),
      connectivity: Connectivity(),
    ),
  );
}
