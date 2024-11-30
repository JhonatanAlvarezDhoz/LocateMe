import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:locate_me/base/constants/app_sizes.dart';
import 'package:locate_me/base/widgets/widgets.dart';
import 'package:locate_me/modules/friend/controller/mobx/friend_store.dart';
import 'package:locate_me/modules/friend/data/models/friend.dart';
import 'package:locate_me/modules/user/controller/mobx/user_store.dart';
import 'package:locate_me/modules/user/controller/session_mobx/session_store.dart';
import 'package:locate_me/modules/user/data/models/user.dart';
import 'package:locate_me/theme/theme_colors.dart';
import 'package:provider/provider.dart';

class UserCard extends StatelessWidget {
  final User user;
  final SessionStore sessionStore;
  final UserStore userStore;
  const UserCard({
    super.key,
    required this.user,
    required this.sessionStore,
    required this.userStore,
  });

  @override
  Widget build(BuildContext context) {
    final friendStore = Provider.of<FriendStore>(context, listen: false);

    return Container(
      height: 195,
      width: 220,
      margin: const EdgeInsets.only(bottom: 15),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ThemeColors.tertiaryLight.withOpacity(0.1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 10),
            blurRadius: 15,
            spreadRadius: -3,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
              ),
              gapW12,
              SizedBox(
                width: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: user.firstName,
                      textAlign: TextAlign.start,
                    ),
                    gapH4,
                    CustomText(text: user.lastName),
                    gapH4,
                    CustomText(text: user.phoneNumber),
                  ],
                ),
              )
            ],
          ),
          gapH12,
          CustomText(text: user.email),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  gapH4,
                  Row(
                    children: [
                      CustomText(text: "N amigos: "),
                      CustomText(text: "5"),
                    ],
                  ),
                  gapH4,
                  Row(
                    children: [
                      CustomText(text: "N ubicaciones: "),
                      CustomText(text: "5"),
                    ],
                  ),
                ],
              ),
              Observer(
                builder: (BuildContext context) {
                  return Container(
                    alignment: Alignment.centerRight,
                    width: 130,
                    child: SizedBox(
                      width: 100,
                      child: CustomButton(
                        text: "Agregar",
                        color: ThemeColors.greenColor.withOpacity(.8),
                        onPressed: () async {
                          log(userStore.user!.friendId!.length.toString());
                          if (userStore.user!.friendId!.length <= 4) {
                            final int userId = sessionStore.session!.userId;
                            final Friend newFriend = Friend(
                                firstName: user.firstName,
                                lastName: user.lastName,
                                email: user.email,
                                phoneNumber: user.phoneNumber,
                                userId: userId,
                                locationId: []);
                            await friendStore.addFriend(newFriend);
                            if (friendStore.isCreated) {
                              await userStore.addFriendToUser(userId, [
                                ...userStore.user!.friendId!,
                                friendStore.friend!.id!
                              ]);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(CustomSnackBar(
                                message: userStore.errorMessage ??
                                    'Se agrego a ${user.firstName} tus amigos',
                                color: ThemeColors.greenColor.withOpacity(0.6),
                              ));
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              CustomSnackBar(
                                message: userStore.errorMessage ??
                                    'solo se puede agregar 5 amigos',
                                color: ThemeColors.redColor.withOpacity(0.6),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          gapH8,
        ],
      ),
    );
  }
}
