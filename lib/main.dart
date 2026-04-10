import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../modul_4_riverpod/widgets/theme.dart';
import '../modul_6_gorouter/myapp_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: CalibreTouchModules()));
}

class CalibreTouchModules extends StatelessWidget {
  const CalibreTouchModules({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: baseTheme,
      title: 'Calibre Touch modules',
      routerConfig: MyappRouter().router,
   
    );
  }
}
