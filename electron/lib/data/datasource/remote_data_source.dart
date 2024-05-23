import 'package:electron/core/api/api_client.dart';
import 'package:electron/data/models/request_model.dart';

abstract class RemoteDataSource {
  Future<RequestTokenModel> validateWithLogin(Map<String, dynamic> requestBody);
  Future<bool> restorePassword(
      String smsCode, String phoneNumber, String newPassword);
}

class RemoteDataSourceImpl
    extends RemoteDataSource {
  final ApiClient _client;

  RemoteDataSourceImpl(this._client);

  @override
  Future<RequestTokenModel> validateWithLogin(
      Map<String, dynamic> requestBody) async {
    final response = await _client.post(
      'api/token/',
      params: requestBody,
    );
    print('response is $response');
    return RequestTokenModel.fromJson(response);
  }

  @override
  Future<bool> restorePassword(
      String smsCode, String phoneNumber, String newPassword) async {
    await _client.post(
      'users/change_password/',
      params: {
        "phone_number": phoneNumber,
        "new_password": newPassword,
        "sms_code": smsCode,
      },
    );
    return true;
  }
}
