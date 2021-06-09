import 'package:doctor/pages/appointment.dart';
import 'package:doctor/pages/chat.dart';
import 'package:doctor/pages/home.dart';
import 'package:doctor/pages/search.dart';
import 'package:doctor/pages/user.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BottomNavWidget extends StatelessWidget {
  static const String navRoute = '/nav';
  const BottomNavWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);
    List<Widget> _buildScreens() {
      return [
        HomeWidget(),
        SearchWidget(),
        AppointmentWidget(),
        ChatWidget(),
        UserWidget()
      ];
    }

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.home),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.search),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.calendar_today),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.chat_bubble),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.person_rounded),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
        ),
      ];
    }

    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(20.0),
            colorBehindNavBar: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 6.0,
                spreadRadius: 5.0,
              ),
            ]),

        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style6, // Choose the nav bar style with this property.
      ),
    );
  }
}
