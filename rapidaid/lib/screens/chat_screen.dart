import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        backgroundColor: const Color(0xFFE51C23),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://via.placeholder.com/40?text=${index + 1}',
              ),
            ),
            title: Text('Contact ${index + 1}'),
            subtitle: Text('Last message from contact ${index + 1}'),
            trailing: const Text('12:30 PM'),
            onTap: () {},
          );
        },
      ),
    );
  }
}
