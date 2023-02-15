import 'package:flutter/cupertino.dart';
import '../../../../../../core/config/routes/app.dart';

class LayoutExercisesUserScreen extends StatelessWidget {
  LayoutExercisesUserScreen({Key? key}) : super(key: key);
  final _bottomNavbarController = PersistentTabController();

  List<Widget> _buildScreens() {
    return [
      const Profile(),
      const WorkOutScreen(),
      ProductScreen(),
      Container(color: Colors.brown),
      Container(color: Colors.yellow),
    ];
  }

  List<String> titlesScreen(BuildContext context) => [
        AppLocalizations.of(context)!.translate(AppStrings.workout)!,
        AppLocalizations.of(context)!.translate(AppStrings.custom)!,
        AppLocalizations.of(context)!.translate(AppStrings.exercises)!,
        AppLocalizations.of(context)!.translate(AppStrings.favorite)!,
        AppLocalizations.of(context)!.translate(AppStrings.me)!,
      ];

  static const IconData fitnessCenter =
      IconData(0xe28d, fontFamily: 'MaterialIcons');

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(fitnessCenter),
        title: AppLocalizations.of(context)!.translate(AppStrings.workout)!,
        activeColorPrimary: AppColor.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.bag),
        title: AppLocalizations.of(context)!.translate(AppStrings.custom)!,
        activeColorPrimary: AppColor.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.shopping_cart),
        title: AppLocalizations.of(context)!.translate(AppStrings.exercises)!,
        activeColorPrimary: AppColor.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite_border),
        title: AppLocalizations.of(context)!.translate(AppStrings.favorite)!,
        activeColorPrimary: AppColor.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.profile_circled),
        title: AppLocalizations.of(context)!.translate(AppStrings.me)!,
        activeColorPrimary: AppColor.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.wColor,
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        toolbarHeight: 10.h,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.sp),
            borderSide: BorderSide(color: AppColor.noColor)),
        title: BlocBuilder<ProfileUserCubit, ProfileUserState>(
          builder: (context, state) {
            return Text(titlesScreen(
                context)[context.read<ProfileUserCubit>().titleIndex]); //
          },
        ),
      ),
      body: SafeArea(
        child: PersistentTabView(
          context,
          controller: _bottomNavbarController,
          screens: _buildScreens(),
          items: _navBarsItems(context),
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
          navBarStyle: NavBarStyle.style1,
          onItemSelected: context.read<ProfileUserCubit>().changeTitleIndex,
        ),
      ),
    );
  }
}
