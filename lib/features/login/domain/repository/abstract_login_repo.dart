import 'package:dartz/dartz.dart';
import 'package:e5d_assesment/features/login/domain/model/login_model.dart';
import 'package:e5d_assesment/features/login/domain/model/user_model.dart';
import 'package:e5d_assesment/features/login/presentation/viewmodel/login_viewmodel.dart';


///
///An abstraction to communicate between the domain and data layers
///
abstract class AbstractLoginRepository {
  Future<Either<LoginUiState, UserModel>> login(ILoginModel params);
}
