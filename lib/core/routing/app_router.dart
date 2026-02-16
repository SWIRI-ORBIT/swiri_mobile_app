import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:swiri/core/helpers/shared_pref_helper.dart';
import 'package:swiri/core/helpers/consts.dart';
import 'package:swiri/core/routing/routes.dart';
import 'package:swiri/features/auth/data/repos/auth_repository.dart';
import 'package:swiri/features/auth/logic/login/login_cubit.dart';
import 'package:swiri/features/auth/logic/signup/signup_cubit.dart';
import 'package:swiri/screens/add_safe_zone_screen.dart';
import 'package:swiri/screens/login_screen.dart';
import 'package:swiri/screens/main_screen.dart';
import 'package:swiri/screens/signup_screen.dart';
import 'package:swiri/screens/splash_screen.dart';

final GetIt getIt = GetIt.instance;

Future<String?> _authRedirect(
  BuildContext? context,
  GoRouterState state,
) async {
  // Check if user is logged in by checking for stored token
  final token = await SharedPrefHelper.getSecuredString(
    SharedPrefKeys.userToken,
  );

  // If token exists, user is logged in
  if (token.isNotEmpty) {
    // If trying to access splash, login, or signup, redirect to main
    if (state.matchedLocation == Routes.splash ||
        state.matchedLocation == Routes.login ||
        state.matchedLocation == Routes.signup) {
      return Routes.main;
    }
  } else {
    // If no token and trying to access main or addSafeZone, redirect to splash
    if (state.matchedLocation == Routes.main ||
        state.matchedLocation == Routes.addSafeZone) {
      return Routes.splash;
    }
  }

  return null; // No redirect needed
}

final GoRouter appRouter = GoRouter(
  initialLocation: Routes.splash,
  redirect: _authRedirect,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => BlocProvider(
        create: (context) => LoginCubit(getIt<AuthRepository>()),
        child: const LoginScreen(),
      ),
    ),
    GoRoute(
      path: Routes.signup,
      builder: (context, state) => BlocProvider(
        create: (context) => SignupCubit(getIt<AuthRepository>()),
        child: const SignupScreen(),
      ),
    ),
    GoRoute(path: Routes.main, builder: (context, state) => const MainScreen()),
    GoRoute(
      path: Routes.addSafeZone,
      builder: (context, state) => const AddSafeZoneScreen(),
    ),
  ],
);
