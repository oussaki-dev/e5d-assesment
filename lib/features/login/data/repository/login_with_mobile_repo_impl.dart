import 'package:dartz/dartz.dart';
import 'package:e5d_assesment/features/login/domain/model/login_model.dart';
import 'package:e5d_assesment/features/login/domain/model/login_with_mobile.dart';
import 'package:e5d_assesment/features/login/domain/model/user_model.dart';
import 'package:e5d_assesment/features/login/domain/repository/abstract_login_repo.dart';
import 'package:e5d_assesment/features/login/presentation/viewmodel/login_viewmodel.dart';
import 'package:e5d_assesment/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginWithMobileRepositoryProvider =
    Provider<AbstractLoginRepository>((ref) => LoginWithMobileRepoImpl(ref));

///
///this is an example repo to show that we can plug multiple repositories 
///to handle different ways of login 
///
class LoginWithMobileRepoImpl implements AbstractLoginRepository {
  LoginWithMobileRepoImpl(this.ref);
  final Ref ref;

  @override
  Future<Either<LoginUiState, UserModel>> login(ILoginModel params) {
    LoginWithMobileModel model = params as LoginWithMobileModel;
    logger.d(model);
    //  Send phone Number ....
    throw UnimplementedError();
  }
}
