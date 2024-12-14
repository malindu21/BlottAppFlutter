import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/user_provider.dart';
import 'utils/app_colors.dart';
import 'utils/app_constants.dart';
import 'utils/app_routes.dart';
import 'viewmodels/dashboard_viewmodel.dart';
import 'views/legel_name_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeData appTheme = ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.light(primary: primaryColor),
    scaffoldBackgroundColor: backgroundColor,
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => DashboardViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: blott,
        theme: appTheme,
        initialRoute: AppRoutes.legalName,
        routes: {
          AppRoutes.legalName: (context) => LegalNameScreen(),
        },
      ),
    );
  }
}
