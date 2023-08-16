import 'package:report_incident/src/data/models/response/auth_model.dart';

abstract class AuthRepository {
  Future<AuthModel> login({
    required String email,
    required String password,
  });
}
