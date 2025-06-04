import 'dart:io';

import 'package:flutter/material.dart';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picture Preview'),
        backgroundColor: Colors.black,
      ),
      body: Image.file(
        File(imagePath),
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        errorBuilder: (context, error, stackTrace) {
          return Center(
            child: Text(
              'Error loading image: $error',
              style: const TextStyle(color: Colors.red),
            ),
          );
        },
      ),
    );
  }
}
