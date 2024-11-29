import 'package:locate_me/base/usecase/use_case.dart';
import 'package:locate_me/modules/user/data/models/user.dart';
import 'package:locate_me/modules/user/data/respository/user_repository.dart';

class UcGetUsersNoParams extends UseCaseNoParams<List<User>> {
  final UserRepository userRepository;

  UcGetUsersNoParams({required this.userRepository});

  @override
  Future<List<User>> call() async {
    final List<User> response = await userRepository.getUsers();

    return response;
  }
}
