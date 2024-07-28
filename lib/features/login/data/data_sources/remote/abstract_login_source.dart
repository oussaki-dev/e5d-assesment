import 'package:e5d_assesment/features/login/domain/model/login_model.dart';
import 'package:e5d_assesment/features/login/domain/model/user_model.dart';

abstract class AbstractLoginSource {
  // Get all article
  Future<UserModel> login(ILoginModel params);
}
