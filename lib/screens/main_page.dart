import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tema/const.dart';
import 'package:tema/screens/trailers.page.dart';

import 'account_page.dart';
import 'community_page.dart';
import 'friends_page.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _widgetOptions = [
    const HomePage(),
    const CommunityPage(),
    const TrailersPage(),
    const FriendsPage(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(22),
            topLeft: Radius.circular(22),
          ),
          gradient: LinearGradient(
            colors: [kBottomBarFirstColor, kBottomBarSecondColor],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0.2, 0.6],
            tileMode: TileMode.clamp,
          ),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,

          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          currentIndex: _currentIndex,
          //selectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/Home.svg',
              ),
              activeIcon: SvgPicture.asset('assets/icons/Home_fill.svg'),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/Community.svg',
              ),
              activeIcon: SvgPicture.asset('assets/icons/Community_fill.svg'),
              label: 'Community',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/Trailers.svg',
              ),
              activeIcon: SvgPicture.asset('assets/icons/Trailers_fill.svg'),
              label: 'Trailers',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/Friends.svg',
              ),
              activeIcon: SvgPicture.asset('assets/icons/Friends_fill.svg'),
              label: 'Friends',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/Account.svg',
              ),
              activeIcon: SvgPicture.asset('assets/icons/Account_fill.svg'),
              label: 'Account',
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _widgetOptions,
        ),
      ),
    );
  }
}
