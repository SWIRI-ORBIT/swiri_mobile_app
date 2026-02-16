import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
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

final GoRouter appRouter = GoRouter(
  // initialLocation: Routes.splash,
  initialLocation: Routes.main,
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
