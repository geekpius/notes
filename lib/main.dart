import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'services/git_it_service_locator.dart';
import 'utils/app_navigator_util.dart';
import 'utils/app_theme.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    setUpGetItServiceLocator();

    await preLoaders();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoute.splashView,
      onGenerateRoute: AppNavigatorUtil.generateRoute,
      navigatorKey: AppNavigatorUtil.navigatorKey,
    );
  }
}



Future<void> preLoaders() async{

}

void preLoadLocalStorage(BuildContext context) {
}
