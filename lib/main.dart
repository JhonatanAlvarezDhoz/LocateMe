import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:locate_me/routes/app_pages.dart';
import 'package:locate_me/routes/app_routes.dart';
import 'package:locate_me/theme/theme.dart';
import 'package:locate_me/utils/injector.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const dependencies = Injector.dependencies;
  runApp(MainAppInjection(
    dependencies: await dependencies(),
  ));
}

class MainAppInjection extends StatelessWidget {
  final List<SingleChildWidget> dependencies;
  const MainAppInjection({super.key, required this.dependencies});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: dependencies,
      child: const MainApp(),
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: customTheme,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: child!,
        );
      },
      initialRoute: AppRoutes.splashPage,
      onGenerateRoute: AppPages.routes,
    );
  }
}
