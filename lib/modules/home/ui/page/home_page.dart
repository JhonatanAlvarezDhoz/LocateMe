import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:locate_me/base/widgets/widgets.dart';
import 'package:locate_me/modules/home/ui/widgets/user_card.dart';
import 'package:locate_me/modules/user/controller/mobx/user_store.dart';
import 'package:locate_me/modules/user/controller/session_mobx/session_store.dart';
import 'package:locate_me/modules/user/data/models/user.dart';
import 'package:locate_me/utils/utils.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _loadLocations();
  }

  void _loadLocations() async {
    final userStore = Provider.of<UserStore>(context, listen: false);
    final sessionStore = Provider.of<SessionStore>(context, listen: false);
    await userStore.getUsers();
    await sessionStore.getSesseion();
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final userStore = Provider.of<UserStore>(context, listen: false);
    final sessionStore = Provider.of<SessionStore>(context, listen: false);

    return Scaffold(
        body: Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      height: responsive.height,
      width: responsive.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SafeArea(
              child: CustomText(
            text: "Personas que quisas conoscas",
            fontSize: 20,
            fontWeight: FontWeight.w500,
          )),
          Observer(
            builder: (BuildContext context) {
              List<User> completeUserList = userStore.userList;
              final List<User> userList = completeUserList
                  .where((user) => user.id != sessionStore.session?.userId)
                  .toList();
              return Container(
                height: responsive.heightResponsive(68),
                padding: const EdgeInsets.all(15),
                child: ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      final user = userList[index];
                      return UserCard(user: user);
                    }),
              );
            },
          ),
          // UserCard(user: user),
        ],
      ),
    ));
  }
}
