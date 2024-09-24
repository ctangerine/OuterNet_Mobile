import 'package:outernet/data/models/user_model.dart';

class PostgreSQLDatasource {
  // Fake api call and returning fake data
  Future<UserModel> login(String email, String password) async {
    final response = await _fakeApiCall();

    return UserModel.fromJson(response);
  }

  Future<Map<String, dynamic>> _fakeApiCall() async {
    await Future.delayed(const Duration(seconds: 2)); // Giả lập thời gian gọi API

    // Giả lập dữ liệu trả về từ API
    return {
      "id": '1',
      "name": "John Doe",
      "email": "johndoe@example.com",
      "token": "fake_token_123"
    };
  }
}