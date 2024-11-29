// import 'package:mobx/mobx.dart';
import 'package:locate_me/modules/friend/controller/mobx/friend_store.dart';
import 'package:locate_me/modules/friend/data/repository/friend_repository.dart';
import 'package:locate_me/modules/friend/data/usecase/use_case.dart';
import 'package:locate_me/modules/location/controller/location_mobx/location_store.dart';
import 'package:locate_me/modules/location/data/repository/location_repository.dart';
import 'package:locate_me/modules/location/data/usecase_location/use_case.dart';
import 'package:locate_me/modules/user/controller/mobx/user_store.dart';
import 'package:locate_me/modules/user/data/respository/user_repository.dart';
import 'package:locate_me/modules/user/data/usecase/use_case.dart';
import 'package:locate_me/services/isar_database.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Injector {
  static Future<List<SingleChildWidget>> dependencies() async {
    final isarUser = await IsarDatabase.userInstance;
    final isarFriend = await IsarDatabase.friendInstance;
    final isarLocation = await IsarDatabase.locationInstance;

    final userRepository = UserRepository(isar: isarUser);
    final friendRepository = FrinedRepository(isar: isarFriend);
    final locationRepository = LocationRepository(isar: isarLocation);

    return [
      Provider<UserStore>(
        create: (_) => UserStore(
            ucCreateUser: UcCreateUser(userRepository: userRepository),
            ucUpdateUser: UcUpdateUser(userRepository: userRepository),
            ucChangePassword: UcChangePassword(userRepository: userRepository),
            ucChangeProfilePhoto:
                UcChangeProfilePhoto(userRepository: userRepository),
            ucDeleteUser: UcDeleteUser(userRepository: userRepository),
            getUsersNoParams:
                UcGetUsersNoParams(userRepository: userRepository)),
      ),
      Provider<FriendStore>(
          create: (_) => FriendStore(
              ucAddFriend: UcAddFriend(friendRepository: friendRepository),
              ucAddLocationToFriend:
                  UcAddLocationToFriend(frinedRepository: friendRepository),
              ucGetFrienByUserId:
                  UcGetFrienByUserId(frinedRepository: friendRepository),
              ucDeleteFriend:
                  UcDeleteFriend(frinedRepository: friendRepository))),
      Provider<LocationStore>(
          create: (_) => LocationStore(
              ucCreateLocation:
                  UcCreateLocation(locationRepository: locationRepository),
              ucGetLocationByUserId:
                  UcGetLocationByUserId(locationRepository: locationRepository),
              ucAddPhotoToLocation:
                  UcAddPhotoToLocation(locationRepository: locationRepository),
              ucDeleteLocation:
                  UcDeleteLocation(locationRepository: locationRepository))),
      // Provider(create: (_) => PhotoStrore())
    ];
  }

  // Provider<UserStore>(
  //   create: (_) => UserStore(),
  // ),
  // Provider<FriendStore>(
  //   create: (_) => FriendStore(),
  // ),
  // Puedes convertir tus BlocProviders existentes a Providers de MobX
  // Por ejemplo:
  // Provider<LoginStore>(
  //   create: (_) => LoginStore(
  //     loginUseCase: LoginUseCase(repository: LoginRepository()),
  //     // otras dependencias
  //   ),
  // )
}
