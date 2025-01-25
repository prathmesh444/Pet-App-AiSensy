
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../route/route_navigation.dart';

class PetApp extends StatefulWidget {
  const PetApp({super.key});

  @override
  State<PetApp> createState() => _PetAppState();
}

class _PetAppState extends State<PetApp> {


  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, _) {
        return GetMaterialApp(
          initialRoute:  RouteNavigation.dashboardScreenRoute,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteNavigation.generateRoute,
          darkTheme: ThemeData(brightness: Brightness.dark,),
          theme: ThemeData(brightness: Brightness.light),
          themeMode: ThemeMode.light,
        );
      }
    );
  }
}