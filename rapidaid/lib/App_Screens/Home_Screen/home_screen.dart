/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapidaidv2/App_Components/App_Style/colors.dart';
import 'package:rapidaidv2/App_Components/App_Style/padding.dart';
import 'package:rapidaidv2/App_Functions/Map_Logic/map_location.dart';
import 'package:rapidaidv2/App_Screens/Home_Screen/Trending/trending_page.dart';
import 'package:rapidaidv2/App_Screens/Home_Screen/Trending/trending_reports.dart';
import 'package:rapidaidv2/App_Components/App_Widgets/action_button.dart';
import 'package:rapidaidv2/App_Screens/Profile_Screen/profilescreen.dart';
import 'package:unicons/unicons.dart';

import 'Home_Screen_SubPages/Emergency_Contact_Screen/emergency_contacts_screen.dart';
import 'Home_Screen_SubPages/First_Aid/first_aid.dart';
import 'Home_Screen_SubPages/Emergency_Services/report_emergency.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final locationProvider = Provider.of<LocationProvider>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: myMainColor,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Top Row: Profile + Bell Icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileScreen(),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: myMainColor,
                          child: const Icon(
                            UniconsLine.user_circle,
                            size: 40,
                            color: myAltColor,
                          ),
                        ),
                      ),
                      Text(
                        locationProvider.currentAddress ??
                            'Fetching location...',
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(UniconsLine.bell, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Greeting and Image
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      // Left side (text)
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pokuaa Nyamekye',
                              style: textTheme.headlineSmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Need some help today?',
                              style: textTheme.bodyMedium?.copyWith(
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Right side (image)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/emergency_services.png',

                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 80,
                              width: 80,
                              color: Colors.white,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: mycontentPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Safety Tip Section
            Text(
              'Today\'s Safety Tip!',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.red.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Get enough sleep at night. Sleep plays a vital role in your physical health. You need at least 8 hours of sleep to power through the day!',
                style: textTheme.bodyMedium,
              ),
            ),

            const SizedBox(height: 24),

            /// Actions Section
            Text(
              'What would you like to do?',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyActionButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmergencyContactsScreen(),
                      ),
                    );
                  },
                  text: 'Emergency\nContacts',
                  icon: Icons.call,
                ),
                MyActionButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReportEmergency(),
                      ),
                    );
                  },
                  text: 'Report An\nEmergency',
                  icon: Icons.warning,
                ),
                MyActionButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FirstAid()),
                    );
                  },
                  text: 'First Aid',
                  icon: Icons.medical_services,
                ),
              ],
            ),

            const SizedBox(height: 24),

            /// Latest News
            InkWell(
              onLongPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TrendingPage()),
                );
              },
              child: Text(
                'Trending Reports',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Container(
                // height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TrendingReports(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/

/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:rapidaidv2/App_Components/App_Style/colors.dart';
import 'package:rapidaidv2/App_Components/App_Style/padding.dart';
import 'package:rapidaidv2/App_Functions/Map_Logic/map_location.dart';
import 'package:rapidaidv2/App_Components/App_Widgets/action_button.dart';
import 'package:rapidaidv2/App_Screens/Home_Screen/Trending/trending_page.dart';
import 'package:rapidaidv2/App_Screens/Home_Screen/Trending/trending_reports.dart';
import 'package:rapidaidv2/App_Screens/Home_Screen/Home_Screen_SubPages/Emergency_Contact_Screen/emergency_contacts_screen.dart';
import 'package:rapidaidv2/App_Screens/Home_Screen/Home_Screen_SubPages/Emergency_Services/report_emergency.dart';
import 'package:rapidaidv2/App_Screens/Home_Screen/Home_Screen_SubPages/First_Aid/first_aid.dart';
import 'package:rapidaidv2/App_Screens/Profile_Screen/profilescreen.dart';
import 'package:rapidaidv2/Providers/user_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return "Good morning";
    if (hour < 17) return "Good afternoon";
    return "Good evening";
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final locationProvider = Provider.of<LocationProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    final userData = userProvider.user;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: myMainColor,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Top Row: Profile + Location + Notifications
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ProfileScreen(),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 24,
                          backgroundImage:
                              userData?.profilePhotoUrl != null
                                  ? NetworkImage(userData!.profilePhotoUrl!)
                                  : null,
                          backgroundColor: myAltColor,
                          child:
                              userData?.profilePhotoUrl == null
                                  ? const Icon(
                                    UniconsLine.user_circle,
                                    size: 40,
                                    color: myMainColor,
                                  )
                                  : null,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            locationProvider.currentAddress ??
                                'Fetching location...',
                            textAlign: TextAlign.center,
                            style: textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(UniconsLine.bell, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Greeting & Emergency Illustration
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Greeting Text
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${_getGreeting()}, ${userData?.uid ?? 'User'}",
                              style: textTheme.headlineSmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Need some help today?',
                              style: textTheme.bodyMedium?.copyWith(
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Illustration
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/emergency_services.png',
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (_, __, ___) => Container(
                                height: 80,
                                width: 80,
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      // Body content
      body: Padding(
        padding: mycontentPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Safety Tip
            Text(
              'Today\'s Safety Tip!',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.red.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Get enough sleep at night. Sleep plays a vital role in your physical health. You need at least 8 hours of sleep to power through the day!',
                style: textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 24),

            // Actions
            Text(
              'What would you like to do?',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyActionButton(
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const EmergencyContactsScreen(),
                        ),
                      ),
                  text: 'Emergency\nContacts',
                  icon: Icons.call,
                ),
                MyActionButton(
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ReportEmergency(),
                        ),
                      ),
                  text: 'Report An\nEmergency',
                  icon: Icons.warning,
                ),
                MyActionButton(
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const FirstAid()),
                      ),
                  text: 'First Aid',
                  icon: Icons.medical_services,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Trending Reports
            InkWell(
              onLongPress:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const TrendingPage()),
                  ),
              child: Text(
                'Trending Reports',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(child: TrendingReports()),
          ],
        ),
      ),
    );
  }
} */

/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:rapidaidv2/App_Components/App_Style/colors.dart';
import 'package:rapidaidv2/App_Components/App_Style/padding.dart';
import 'package:rapidaidv2/App_Functions/Map_Logic/map_location.dart'
    as map_logic;
import 'package:rapidaidv2/App_Components/App_Widgets/action_button.dart';
import 'package:rapidaidv2/App_Screens/Home_Screen/Trending/trending_page.dart';
import 'package:rapidaidv2/App_Screens/Home_Screen/Trending/trending_reports.dart';
import 'package:rapidaidv2/App_Screens/Home_Screen/Home_Screen_SubPages/Emergency_Contact_Screen/emergency_contacts_screen.dart';
import 'package:rapidaidv2/App_Screens/Home_Screen/Home_Screen_SubPages/Emergency_Services/report_emergency.dart';
import 'package:rapidaidv2/App_Screens/Home_Screen/Home_Screen_SubPages/First_Aid/first_aid.dart';
import 'package:rapidaidv2/App_Screens/Profile_Screen/profilescreen.dart';
import 'package:rapidaidv2/Providers/user_provider.dart';
import 'package:rapidaidv2/providers/location_provider.dart' as loc_provider;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return "Good morning";
    if (hour < 17) return "Good afternoon";
    return "Good evening";
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final locationProvider = Provider.of<loc_provider.LocationProvider>(
      context,
    );
    final userProvider = Provider.of<UserProvider>(context);
    final userData = userProvider.user;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: myMainColor,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Top Row: Profile + Location + Notifications
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ProfileScreen(),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 24,
                          backgroundImage:
                              userData?.profilePhotoUrl != null
                                  ? NetworkImage(userData!.profilePhotoUrl!)
                                  : null,
                          backgroundColor: myAltColor,
                          child:
                              userData?.profilePhotoUrl == null
                                  ? const Icon(
                                    UniconsLine.user_circle,
                                    size: 40,
                                    color: myMainColor,
                                  )
                                  : null,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            locationProvider.currentAddress ??
                                'Fetching location...',
                            textAlign: TextAlign.center,
                            style: textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(UniconsLine.bell, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // Greeting & Emergency Illustration
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Greeting Text
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${_getGreeting()}, ${userData?.uid ?? 'User'}",
                              style: textTheme.headlineSmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Need some help today?',
                              style: textTheme.bodyMedium?.copyWith(
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Illustration
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/emergency_services.png',
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (_, __, ___) => Container(
                                height: 80,
                                width: 80,
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      // Body content
      body: Padding(
        padding: mycontentPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Safety Tip
            Text(
              'Today\'s Safety Tip!',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.red.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Get enough sleep at night. Sleep plays a vital role in your physical health. You need at least 8 hours of sleep to power through the day!',
                style: textTheme.bodyMedium,
              ),
            ),
            const SizedBox(height: 24),

            // Actions
            Text(
              'What would you like to do?',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyActionButton(
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const EmergencyContactsScreen(),
                        ),
                      ),
                  text: 'Emergency\nContacts',
                  icon: Icons.call,
                ),
                MyActionButton(
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ReportEmergency(),
                        ),
                      ),
                  text: 'Report An\nEmergency',
                  icon: Icons.warning,
                ),
                MyActionButton(
                  onTap:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const FirstAid()),
                      ),
                  text: 'First Aid',
                  icon: Icons.medical_services,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Trending Reports
            InkWell(
              onLongPress:
                  () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const TrendingPage()),
                  ),
              child: Text(
                'Trending Reports',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(child: TrendingReports()),
          ],
        ),
      ),
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rapidaidv2/App_Components/App_Style/colors.dart';
import 'package:rapidaidv2/App_Components/App_Style/padding.dart';
import 'package:rapidaidv2/App_Functions/Map_Logic/map_location.dart';
import 'package:rapidaidv2/App_Screens/Home_Screen/Trending/trending_page.dart';
import 'package:rapidaidv2/App_Screens/Home_Screen/Trending/trending_reports.dart';
import 'package:rapidaidv2/App_Components/App_Widgets/action_button.dart';
import 'package:rapidaidv2/App_Screens/Profile_Screen/profilescreen.dart';
import 'package:unicons/unicons.dart';

import 'Home_Screen_SubPages/Emergency_Contact_Screen/emergency_contacts_screen.dart';
import 'Home_Screen_SubPages/First_Aid/first_aid.dart';
import 'Home_Screen_SubPages/Emergency_Services/report_emergency.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final locationProvider = Provider.of<LocationProvider>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: myMainColor,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Top Row: Profile + Bell Icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileScreen(),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: myMainColor,
                          child: const Icon(
                            UniconsLine.user_circle,
                            size: 40,
                            color: myAltColor,
                          ),
                        ),
                      ),
                      Text(
                        locationProvider.currentAddress ??
                            'Fetching location...',
                        style: textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(UniconsLine.bell, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Greeting and Image
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left side (text)
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pokuaa Nyamekye',
                              style: textTheme.headlineSmall?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Need some help today?',
                              style: textTheme.bodyMedium?.copyWith(
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),

                      // Right side (image)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/emergency_services.png',
                          //height: 80,
                          //width: 80,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 80,
                              width: 80,
                              color: Colors.white,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: mycontentPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Safety Tip Section
            Text(
              'Today\'s Safety Tip!',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.red.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Get enough sleep at night. Sleep plays a vital role in your physical health. You need at least 8 hours of sleep to power through the day!',
                style: textTheme.bodyMedium,
              ),
            ),

            const SizedBox(height: 24),

            /// Actions Section
            Text(
              'What would you like to do?',
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyActionButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EmergencyContactsScreen(),
                      ),
                    );
                  },
                  text: 'Emergency\nContacts',
                  icon: Icons.call,
                ),
                MyActionButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReportEmergency(),
                      ),
                    );
                  },
                  text: 'Report An\nEmergency',
                  icon: Icons.warning,
                ),
                MyActionButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FirstAid()),
                    );
                  },
                  text: 'First Aid',
                  icon: Icons.medical_services,
                ),
              ],
            ),

            const SizedBox(height: 24),

            /// Latest News
            InkWell(
              onLongPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TrendingPage()),
                );
              },
              child: Text(
                'Trending Reports',
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),

            Container(
              height: 200, // You can adjust this height as needed
              width: double.infinity,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: TrendingReports(),
            ),
          ],
        ),
      ),
    );
  }
}
