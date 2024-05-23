import 'package:dartz/dartz.dart';
import 'package:electron/core/entities/app_error.dart';
import 'package:electron/core/entities/no_params.dart';
import 'package:electron/core/usecases/usecase.dart';
import 'package:electron/domain/entities/request_entity.dart';
import 'package:electron/domain/repositories/repository.dart';
import 'package:equatable/equatable.dart';


class LogginedUser extends UseCase<void, NoParams> {
  final Repository _authenticationRepository;

  LogginedUser(this._authenticationRepository);

  @override
  Future<Either<AppError, bool>> call(NoParams params) =>
      _authenticationRepository.logginedUser();
}

class LoginUser extends UseCase<bool, LoginRequestParams> {
  final Repository _authenticationRepository;

  LoginUser(this._authenticationRepository);

  @override
  Future<Either<AppError, bool>> call(LoginRequestParams params) async =>
      _authenticationRepository.loginUser(params.toJson());
}

class LogoutUser extends UseCase<void, NoParams> {
  final Repository _authenticationRepository;

  LogoutUser(this._authenticationRepository);

  @override
  Future<Either<AppError, void>> call(NoParams params) async =>
      _authenticationRepository.logoutUser();
}

class RestorePassword extends UseCase<bool, RestorePasswordParams> {
  final Repository repository;
  RestorePassword(this.repository);
  @override
  Future<Either<AppError, bool>> call(RestorePasswordParams params) async {
    return await repository.restorePassword(
      params.smsCode,
      params.phoneNumber,
      params.newPassword,
    );
  }
}

class RestorePasswordParams extends Equatable {
  final String smsCode;
  final String newPassword;
  final String phoneNumber;

  const RestorePasswordParams({
    required this.smsCode,
    required this.newPassword,
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [newPassword];
}
