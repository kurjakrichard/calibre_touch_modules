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
    initialLocation: RouteLocation.home.name,
    routes: [
      GoRoute(
        name: Routes.home.name,
        path: RouteLocation.home.name,
        //build a page by builder
        builder: HomePage.builder,
        routes: [
          GoRoute(
            name: Routes.splash.name,
            path: RouteLocation.splash.name,
            //only test purpose wiht pageBuilder
            pageBuilder: (context, state) =>
                const MaterialPage(child: SplashPage()),
          ),
          GoRoute(
            name: Routes.firstrun.name,
            path: RouteLocation.firstrun.name,
            pageBuilder: (context, state) =>
                const MaterialPage(child: OnboardingPage()),
          ),
          GoRoute(
            name: Routes.riverpod.name,
            path: RouteLocation.riverpod.name,
            //only test purposes with builder and build a page here
            builder: (context, state) => const RiverpodPage(),
          ),
          GoRoute(
            name: Routes.gorouter.name,
            path: RouteLocation.gorouter.name,
            builder: (context, state) =>  GorouterPage(
              gorouter: 'gorouter', name: state.pathParameters['name']!, 
            ),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) =>  ErrorPage(error: state.error),
  );
}
