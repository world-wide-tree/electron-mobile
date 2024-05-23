import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:electron/core/api/api_exceptions.dart';
import 'package:electron/core/entities/app_error.dart';
import 'package:electron/data/datasource/local_data_source.dart';
import 'package:electron/data/datasource/remote_data_source.dart';
import 'package:electron/domain/repositories/repository.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;

  RepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
  );

  @override
  Future<Either<AppError, bool>> loginUser(Map<String, dynamic> params) async {
     print('params is $params');
    try {
      final validateWithLoginToken =
          await _remoteDataSource.validateWithLogin(params);
       
      if (validateWithLoginToken.access != null) {
        await _localDataSource
            .saveSessionId(validateWithLoginToken.access!);
            print('access token is ${await _localDataSource.getSessionId()}');
        return const Right(true);
      }
      return const Left(AppError(appErrorType: AppErrorType.sessionDenied));
    } on SocketException {
      return const Left(AppError(appErrorType: AppErrorType.network));
    } on UnauthorisedException {
      return const Left(AppError(appErrorType: AppErrorType.unauthorised));
    } on Exception {
      return const Left(AppError(appErrorType: AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, void>> logoutUser() async {
    final sessionId = await _localDataSource.getSessionId();
    if (sessionId != null) {
      await Future.wait([
        // _remoteDataSource.deleteSession(sessionId),
        _localDataSource.deleteSessionId(),
      ]);
    }
    return const Right(null);
  }

  @override
  Future<Either<AppError, bool>> restorePassword(
      String smsCode, String phoneNumber, String newPassword) async {
    try {
      final data = await _remoteDataSource.restorePassword(
        smsCode,
        phoneNumber,
        newPassword,
      );
      return Right(data);
    } on SocketException {
      return const Left(AppError(appErrorType: AppErrorType.network));
    } on UnauthorisedException {
      return const Left(AppError(appErrorType: AppErrorType.unauthorised));
    } on ExceptionWithMessage catch (e) {
      return Left(AppError(
          appErrorType: AppErrorType.msgError, errorMessage: e.message));
    } on Exception {
      return const Left(AppError(appErrorType: AppErrorType.api));
    }
  }

  @override
  Future<Either<AppError, bool>> logginedUser() async {
    final sessionId = await _localDataSource.getSessionId();

    if (sessionId == null || sessionId.isEmpty) {
      return const Right(false);
    } else {
      return const Right(true);
    }
  }

}
