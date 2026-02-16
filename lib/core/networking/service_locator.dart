import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:swiri/core/networking/dio_factory.dart';
import 'package:swiri/features/auth/data/api/auth_api_service.dart';
import 'package:swiri/features/auth/data/repos/auth_repository.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Initialize and register Dio
  final dio = await DioFactory.getDio();
  getIt.registerSingleton<Dio>(dio);

  // Register API Service
  getIt.registerSingleton<AuthApiService>(AuthApiService(getIt<Dio>()));

  // Register Repository
  getIt.registerSingleton<AuthRepository>(
    AuthRepository(getIt<AuthApiService>()),
  );
}
