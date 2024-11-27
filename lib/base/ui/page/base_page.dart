import 'package:flutter/material.dart';
import 'package:locate_me/base/widgets/widgets.dart';
import 'package:locate_me/modules/home/ui/page/home_page.dart';
import 'package:locate_me/modules/location/ui/page/location_page.dart';
import 'package:locate_me/modules/user/ui/page/user_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onTabTapped(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          leading: const Icon(Icons.location_history),
          title: CustomText(text: "LocateMe")),
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: HomePage(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: LocationPage(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: UserPage(),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: CustomBottomNavigationBar(
          currentIndex: _currentIndex,
          onChange: _onTabTapped,
        ),
      ),
    );
  }
}
