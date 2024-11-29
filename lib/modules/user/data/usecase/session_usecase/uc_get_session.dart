import 'package:locate_me/base/usecase/use_case.dart';
import 'package:locate_me/modules/user/data/models/session/session.dart';
import 'package:locate_me/modules/user/data/respository/session_repository.dart';

class UcGetSessionsNoParams extends UseCaseNoParams<Session?> {
  final SessionRepository sessionRepository;

  UcGetSessionsNoParams({required this.sessionRepository});

  @override
  Future<Session?> call() async {
    final Session? response = await sessionRepository.getSesion();
    if (response == null) {
      return null;
    }
    return response;
  }
}
