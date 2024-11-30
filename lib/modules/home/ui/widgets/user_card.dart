import 'package:flutter/material.dart';
import 'package:locate_me/base/constants/app_sizes.dart';
import 'package:locate_me/base/widgets/widgets.dart';
import 'package:locate_me/modules/user/data/models/user.dart';
import 'package:locate_me/theme/theme_colors.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
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
              Container(
                alignment: Alignment.centerRight,
                width: 130,
                child: SizedBox(
                  width: 100,
                  child: CustomButton(
                    text: "Agregar",
                    color: ThemeColors.greenColor.withOpacity(.8),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          gapH8,
        ],
      ),
    );
  }
}
