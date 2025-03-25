// Updates Screen
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Red header with logo
            Container(
              padding: const EdgeInsets.all(16),
              color: const Color(0xFFE51C23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.local_hospital, color: Colors.white),
                      const SizedBox(width: 8),
                      Text(
                        'RapidAid',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Updates',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Search bar
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                ),
              ),
            ),

            // Channels section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Channels',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFFE51C23),
                      side: const BorderSide(color: Color(0xFFE51C23)),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 0,
                      ),
                      minimumSize: const Size(0, 30),
                    ),
                    child: const Text('Explore'),
                  ),
                ],
              ),
            ),

            // Channel item
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: NetworkImage('https://via.placeholder.com/40'),
              ),
              title: const Text('Afrifa Community'),
              onTap: () {},
            ),

            const Divider(),

            // Find channels to follow
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Find channels to follow',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),

            // Channel list
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://via.placeholder.com/40',
                      ),
                    ),
                    title: const Text('Afrifa Community'),
                    onTap: () {},
                  );
                },
              ),
            ),

            // Explore more button
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE51C23),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Explore more'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
