import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:swiri/features/auth/data/repos/auth_repository.dart';
import 'package:swiri/features/auth/logic/login/login_cubit.dart';
import 'package:swiri/features/auth/logic/signup/signup_cubit.dart';
import 'package:swiri/screens/login_screen.dart';
import 'package:swiri/screens/signup_screen.dart';
import 'package:swiri/screens/splash_screen.dart';

final GetIt getIt = GetIt.instance;

// Route names
const String splashRoute = '/';
const String loginRoute = '/login';
const String signupRoute = '/signup';
const String mainRoute = '/main';

final GoRouter appRouter = GoRouter(
  initialLocation: splashRoute,
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
    GoRoute(
      path: '/login',
      builder: (context, state) => BlocProvider(
        create: (context) => LoginCubit(getIt<AuthRepository>()),
        child: const LoginScreen(),
      ),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => BlocProvider(
        create: (context) => SignupCubit(getIt<AuthRepository>()),
        child: const SignupScreen(),
      ),
    ),
  ],
);
