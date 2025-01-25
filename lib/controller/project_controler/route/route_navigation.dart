
import 'package:pet_app/view/dashboard/dashboard_screen.dart';
import 'package:pet_app/view/details/pet_detail_screen.dart';
import 'package:pet_app/view/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class RouteNavigation {
  static const String homeScreenRoute = '/homeScreen';
  static const String petDetailScreenRoute = '/petDetailScreen';
  static const String dashboardScreenRoute = '/';



  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case dashboardScreenRoute:
        return _customFadeRoute(child: const DashboardScreen());

      case homeScreenRoute:
        return _customFadeRoute(child: const HomeScreen());


        case petDetailScreenRoute:
        final args = settings.arguments as PetDetailScreen;
          return _customFadeRoute(child: PetDetailScreen( pet: args.pet, index: args.index,));


      default: return _customFadeRoute(child: const HomeScreen(),);

    }
  }

  static PageTransition _customFadeRoute({required child}){
    return PageTransition(
      type: PageTransitionType.fade,
      duration: const Duration(milliseconds: 500),
      child: child,
    );
  }

}
