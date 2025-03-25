import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Red Header
            Container(
              color: const Color(0xFFE51C23),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text(
                  //       'Location',
                  //       style: TextStyle(color: Colors.white, fontSize: 12),
                  //     ),
                  //   ],
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // User profile image
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: const NetworkImage(
                          'https://via.placeholder.com/30',
                        ),
                      ),
                      // Location
                      Row(
                        children: const [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(
                            " Location\n"
                            "Tema, Ghana",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                      // Notification bell
                      const Icon(
                        Icons.notifications_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Welcome text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Welcome!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Pokuaa Nyamekye',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Text(
                            'need some assistance today?',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      // Emergency services image
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        child: Image.asset(
                          'assets/images/emergency_services.png',
                          height: 100,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 60,
                              width: 120,
                              color: Colors.transparent,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Tip of the day
                      const Text(
                        'Today\'s Safety Tip!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.red.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            // Text(
                            //   'Tip for the day',
                            //   style: TextStyle(
                            //     fontWeight: FontWeight.bold,
                            //     fontSize: 14,
                            //   ),
                            // ),
                            // SizedBox(height: 8),
                            Text(
                              'Get enough sleep at night. Sleep plays a vital role in your physical health. You need at least 8 hours of sleep to power through the day!',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // What would you like to do
                      const Text(
                        'What would you like to do?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _actionButton(
                            context,
                            'Contact\nEmergency\nResponse',
                            Icons.call,
                            () {},
                          ),
                          _actionButton(
                            context,
                            'Report An\nEmergency',
                            Icons.warning,
                            () {},
                          ),
                          _actionButton(
                            context,
                            'First Aid',
                            Icons.medical_services,
                            () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // What's trending
                      const Text(
                        'What\'s trending?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      _trendingCard(
                        'assets/images/trending1.png',
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc accumulate libero et interdum, ac aliquet odio mattis.',
                      ),
                      const SizedBox(height: 16),
                      _trendingCard(
                        'assets/images/trending2.png',
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc accumulate libero et interdum, ac aliquet odio mattis.',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFFE51C23),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: (index) {
          switch (index) {
            case 0:
              // Home - already here
              break;
            case 1:
              // Map
              context.go('/map');
              break;
            case 2:
              // Camera
              context.go('/camera');
              break;
            case 3:
              // Chat
              context.go('/chat');
              break;
            case 4:
              // Profile
              context.go('/profile');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: '',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _actionButton(
    BuildContext context,
    String text,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: SizedBox(
          height: 100,
          child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black87,
              elevation: 0,
              side: BorderSide(color: Colors.red.shade300),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 16,
                  color: const Color.fromARGB(255, 237, 69, 57),
                ),
                const SizedBox(height: 4),
                Text(
                  text,
                  style: const TextStyle(fontSize: 10),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _trendingCard(String imageUrl, String description) {
    return Container(
      decoration: BoxDecoration(
        //border: Border.all(color: Colors.grey.shade300),
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imageUrl,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(description, style: const TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
