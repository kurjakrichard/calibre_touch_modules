import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../utils/enums.dart';

class HomePage extends StatelessWidget {
  static HomePage builder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const HomePage();
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Calibre Touch modules'),
        ),
        body: ListView(
          children: [
            ElevatedButton(
                //test purpose with path
                onPressed: () => context.push(RouteLocation.splash.name),
                child: const Text('1 Splash')),
            ElevatedButton(
                //test purpose with path
                onPressed: () => context.go(RouteLocation.firstrun.name),
                child: const Text('2 First run')),
            ElevatedButton(
                onPressed: () =>
                    GoRouter.of(context).goNamed(Routes.riverpod.name),
                child: const Text('4 Riverpod')),
            ElevatedButton(
                onPressed: () =>
                    context.pushNamed(Routes.gorouter.name,
                    //test purpose with query. Not working!!!
                    queryParameters: {
                      'name': 'Query',
                      },
                     pathParameters: {
                      'name': 'Name',
                    }),
                child: const Text('6 Gorouter')),
          ],
        ));
  }
}
