import 'package:calibre_touch_modules/modul_1_splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../app/home_page.dart';
import '../modul_2_onboarding_page/onboarding_page.dart';
import '../modul_4_riverpod/pages/riverpod_screen.dart';
import '../utils/enums.dart';
import 'error_page.dart';
import 'gorouter_page.dart';

class MyappRouter {
  GoRouter router = GoRouter(
    initialLocation: Routes.splash.path,
    routes: [
      GoRoute(
        name: Routes.splash.name,
        path: Routes.splash.path,
        //only test purpose wiht pageBuilder
        pageBuilder: (context, state) =>
            const MaterialPage(child: SplashPage()),
      ),
      GoRoute(
        name: Routes.firstrun.name,
        path: Routes.firstrun.path,
        pageBuilder: (context, state) =>
            const MaterialPage(child: OnboardingPage()),
      ),
      GoRoute(
        name: Routes.home.name,
        path: Routes.home.path,
        //build a page by builder
        builder: HomePage.builder,
        routes: [
          GoRoute(
            name: Routes.riverpod.name,
            path: Routes.riverpod.path,
            //only test purposes with builder and build a page here
            builder: (context, state) => const RiverpodPage(),
          ),
          GoRoute(
            name: Routes.gorouter.name,
            path: Routes.gorouter.path,
            builder: (context, state) => GorouterPage(
              gorouter: 'gorouter',
              name: state.pathParameters['name']!,
            ),
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      // Example of a redirect based on authentication status
      // final isLoggedIn = checkIfUserIsLoggedIn();
      // if (!isLoggedIn && state.subloc != RouteLocation.firstrun.name) {
      //   return RouteLocation.firstrun.name;
      // }
      return null; // No redirection
    },
    errorBuilder: (context, state) => ErrorPage(error: state.error),
  );
}
