import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swiri/core/networking/api_result.dart';
import 'package:swiri/features/auth/data/models/login_request_body.dart';
import 'package:swiri/features/auth/data/repos/auth_repository.dart';
import 'package:swiri/features/auth/logic/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(LoginInitial());

  Future<void> login(String identifier, String password) async {
    emit(LoginLoading());

    final requestBody = LoginRequestBody(
      identifier: identifier,
      password: password,
    );

    final result = await _authRepository.login(requestBody);

    switch (result) {
      case Success():
        emit(LoginSuccess());
      case Failure():
        emit(LoginError(result.error.message ?? 'Login failed'));
    }
  }
}
