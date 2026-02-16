import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swiri/core/networking/api_result.dart';
import 'package:swiri/features/auth/data/models/signup_request_body.dart';
import 'package:swiri/features/auth/data/repos/auth_repository.dart';
import 'package:swiri/features/auth/logic/signup/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepository _authRepository;

  SignupCubit(this._authRepository) : super(SignupInitial());

  Future<void> signup({
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
    required bool agreedToTerms,
  }) async {
    emit(SignupLoading());

    final requestBody = SignupRequestBody(
      email: email,
      phone: phone,
      password: password,
      confirmPassword: confirmPassword,
      agreedToTerms: agreedToTerms,
    );

    final result = await _authRepository.signup(requestBody);

    switch (result) {
      case Success():
        emit(SignupSuccess());
      case Failure():
        emit(SignupError(result.error.message ?? 'Signup failed'));
    }
  }
}
