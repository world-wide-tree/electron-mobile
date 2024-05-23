import 'package:dartz/dartz.dart';
import 'package:electron/core/entities/app_error.dart';

abstract class Repository {
  Future<Either<AppError, bool>> loginUser(Map<String, dynamic> params);
  Future<Either<AppError, void>> logoutUser();
  Future<Either<AppError, bool>> logginedUser();
  Future<Either<AppError, bool>> restorePassword(
      String smsCode, String phoneNumber, String newPassword);
}
