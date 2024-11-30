// import 'package:mobx/mobx.dart';
import 'package:locate_me/modules/friend/controller/mobx/friend_store.dart';
import 'package:locate_me/modules/friend/data/repository/friend_repository.dart';
import 'package:locate_me/modules/friend/data/usecase/use_case.dart';
import 'package:locate_me/modules/location/controller/location_mobx/location_store.dart';
import 'package:locate_me/modules/location/controller/photo_mobx/photo_store.dart';
import 'package:locate_me/modules/location/data/repository/location_repository.dart';
import 'package:locate_me/modules/location/data/repository/photo_repository.dart';
import 'package:locate_me/modules/location/data/usecase_location/use_case.dart';
import 'package:locate_me/modules/user/controller/mobx/user_store.dart';
import 'package:locate_me/modules/user/controller/session_mobx/session_store.dart';
import 'package:locate_me/modules/user/data/respository/session_repository.dart';
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
    final isarPhoto = await IsarDatabase.photoInstance;
    final isarSession = await IsarDatabase.sessionInstance;

    final userRepository = UserRepository(isar: isarUser);
    final friendRepository = FrinedRepository(isar: isarFriend);
    final locationRepository = LocationRepository(isar: isarLocation);
    final photoRepository = PhotoRepository(isar: isarPhoto);
    final sessionRepository = SessionRepository(isar: isarSession);

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
                UcGetUsersNoParams(userRepository: userRepository),
            ucLoginUser: UcLoginUser(userRepository: userRepository),
            ucAddFriendToUser:
                UcAddFriendToUser(userRepository: userRepository),
            ucGetUserById: UcGetUserById(userRepository: userRepository)),
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
      Provider(
          create: (_) => PhotoStore(
              ucCreatePhoto: UcCreatePhoto(photoRepository: photoRepository),
              ucDeletePhoto: UcDeletePhoto(photoRepository: photoRepository),
              ucGetPhotoByLocationId:
                  UcGetPhotoByLocationId(photoRepository: photoRepository))),
      Provider(
          create: (_) => SessionStore(
              ucCreateSession:
                  UcCreateSession(sessionRepository: sessionRepository),
              ucGetSessionsNoParams:
                  UcGetSessionsNoParams(sessionRepository: sessionRepository),
              ucDeleteSession:
                  UcDeleteSession(sessionRepository: sessionRepository)))
    ];
  }
}
