import 'package:e5d_assesment/features/login/domain/model/session_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final NotifierProvider<SessionNotifier, SessionModel?> sessionProvider =
    NotifierProvider<SessionNotifier, SessionModel?>(
  SessionNotifier.new,
);

class SessionNotifier extends Notifier<SessionModel?> {
  @override
  SessionModel? build() {
    return null;
  }

  void setSession({required SessionModel session}) {
    state = session;
  }

  void updateWith({required SessionModel session}) {
    if (state == null) {
      setSession(session: session);
    } else {
      state = state!.copyWith(
        user: session.user,
        isLoggedIn: session.isLoggedIn,
      );
    }
  }

  void logout() {
    state = state!.copyWith(
      user: null,
      isLoggedIn: false,
    );
  }
}
