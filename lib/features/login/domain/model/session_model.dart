import 'package:e5d_assesment/features/login/domain/model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_model.freezed.dart';
part 'session_model.g.dart';


///
/// Responsible for saving session values
///
///
@freezed
class SessionModel with _$SessionModel {
  const factory SessionModel({
    bool? isLoggedIn,
    UserModel? user,
    double? oldBalance // used to revert in case of failure
  }) = _SessionModel;

  factory SessionModel.fromJson(Map<String, Object?> json) =>
      _$SessionModelFromJson(json);
}
