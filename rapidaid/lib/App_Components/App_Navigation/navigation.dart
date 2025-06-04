import 'package:flutter/material.dart';
import 'package:rapidaidv2/App_Components/App_Style/colors.dart';
import 'package:rapidaidv2/App_Screens/Report_Screen/Camera_Screen/camera_screen.dart';
import 'package:rapidaidv2/App_Screens/Home_Screen/home_screen.dart';
import 'package:rapidaidv2/App_Screens/Maps_Screen/maps_screen.dart';
import 'package:rapidaidv2/App_Screens/Reported_Incidents/reported_incidents_list.dart';
import 'package:rapidaidv2/App_Screens/Social_Feed_Screen/social_feed_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:unicons/unicons.dart';

class AppNavigation extends StatefulWidget {
  final int initialIndex;
  const AppNavigation({super.key, this.initialIndex = 2});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _salomonBottomBarItems.length,
      initialIndex: widget.initialIndex,
      vsync: this,
    );
    _currentIndex = widget.initialIndex;
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  final List<Map<String, dynamic>> _salomonBottomBarItems = [
    {'icon': UniconsLine.estate, 'title': 'Home'},
    {'icon': UniconsLine.map_marker, 'title': 'Map'},
    {'icon': UniconsLine.camera, 'title': 'Camera'},
    {'icon': UniconsLine.comments, 'title': 'Chat'},
    {'icon': UniconsLine.play_circle, 'title': 'Reports'},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: TabBarView(
          controller: _tabController,
          children: [
            HomeScreen(),
            MapsScreen(),
            CameraScreen(),
            // Text('camera'),
            // TrendingReports(),
            SocialFeedScreen(),
            ReportedIncidentsList(),
          ],
        ),
        bottomNavigationBar: SalomonBottomBar(
          backgroundColor: myMainColor,
          selectedItemColor: myAltColor,
          unselectedItemColor: myAltColor,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              _tabController.index = index;
            });
          },
          items:
              _salomonBottomBarItems.map((item) {
                return SalomonBottomBarItem(
                  icon: Icon(item['icon']),
                  title: Text(item['title']),
                );
              }).toList(),
        ),
      ),
    );
  }
}






            
            // CameraScreen(cameras: widget.cameras),
            


// int _currentIndex = 0;

  // final List<Map<String, dynamic>> _salomonBottomBarItems = [
  //   {'icon': UniconsLine.estate, 'title': 'Home'},
  //   {'icon': UniconsLine.map_marker, 'title': 'Map'},
  //   {'icon': UniconsLine.camera, 'title': 'Camera'},
  //   {'icon': UniconsLine.comments, 'title': 'Chat'},
  //   {'icon': UniconsLine.play_circle, 'title': 'Reports'},
  // ];

//   final List<GlobalKey<NavigatorState>> _navigatorKeys = List.generate(
//     5,
//     (index) => GlobalKey<NavigatorState>(),
//   );

//   @override
//   void initState() {
//     super.initState();
//     _currentIndex = widget.initialIndex;
//   }

//   Widget _buildOffstageNavigator(int index, Widget screen) {
//     return Offstage(
//       offstage: _currentIndex != index,
//       child: Navigator(
//         key: _navigatorKeys[index],
//         onGenerateRoute: (settings) {
//           return MaterialPageRoute(builder: (_) => screen);
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Stack(
//           children: [
//             _buildOffstageNavigator(0, HomeScreen()),
//             _buildOffstageNavigator(1, MapsScreen()),
//             // _buildOffstageNavigator(2, Text('camera')),
//             _buildOffstageNavigator(2, ReportScreen()),
//             _buildOffstageNavigator(3, SocialFeedScreen()),
//             _buildOffstageNavigator(4, Text('reported incidents')),
//           ],
//         ),
//         bottomNavigationBar: SalomonBottomBar(
//           selectedItemColor: Theme.of(context).colorScheme.secondary,
//           currentIndex: _currentIndex,
//           onTap: (index) {
//             if (_currentIndex == index) {
//               // Pop to first route if re-tapping the same tab
//               _navigatorKeys[index].currentState?.popUntil(
//                 (route) => route.isFirst,
//               );
//             } else {
//               setState(() => _currentIndex = index);
//             }
//           },
//           items:
//               _salomonBottomBarItems.map((item) {
//                 return SalomonBottomBarItem(
//                   icon: Icon(item['icon']),
//                   title: Text(item['title']),
//                 );
//               }).toList(),
//         ),
//       ),
//     );
//   }
// }