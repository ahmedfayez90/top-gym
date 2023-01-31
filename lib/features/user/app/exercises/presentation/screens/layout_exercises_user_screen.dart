import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:top_gym/features/user/app/exercises/presentation/screens/profile.dart';
import '../../../../../../core/config/theme/app_color.dart';
import '../../../../../../core/utils/app_images.dart';
import 'exercise_screen.dart';

class LayoutExercisesUserScreen extends StatelessWidget {
   LayoutExercisesUserScreen({Key? key}) : super(key: key);
  final _bottomNavbarController = PersistentTabController();
  List<Widget> _buildScreens() {
    return [
      Container(color: Colors.cyanAccent),
      ProductScreen(),
      Container(color: Colors.brown),
      Container(color: Colors.yellow),
      const Profile(),


    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon:  Image.asset(AppImages.dumbbell),
        title: "Training",
        activeColorPrimary:AppColor.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.bag),
        title: "Custom",
        activeColorPrimary:AppColor.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.shopping_cart),
        title: "Exercises",
        activeColorPrimary: AppColor.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite_border),
        title: "Report",
        activeColorPrimary:AppColor.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.profile_circled),
        title: "Me",
        activeColorPrimary: AppColor.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PersistentTabView(context,
            controller: _bottomNavbarController,
            screens: _buildScreens(),
            items: _navBarsItems(),
            confineInSafeArea: true,
            backgroundColor: Colors.white,
            handleAndroidBackButtonPress: true,
            resizeToAvoidBottomInset: true,
            stateManagement: true,
            hideNavigationBarWhenKeyboardShows: true,
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(10.0),
              colorBehindNavBar: Colors.white,
            ),
            popAllScreensOnTapOfSelectedTab: true,
            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: const ItemAnimationProperties(
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle.style1),
      ),
    );
  }
}

