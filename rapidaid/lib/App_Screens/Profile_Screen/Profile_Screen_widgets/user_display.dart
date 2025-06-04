import 'package:flutter/material.dart';
import 'package:rapidaidv2/App_Components/App_Style/padding.dart';
import 'package:unicons/unicons.dart';

class UserDisplayWidget extends StatefulWidget {
  const UserDisplayWidget({super.key});

  @override
  State<UserDisplayWidget> createState() => _UserDisplayWidgetState();
}

class _UserDisplayWidgetState extends State<UserDisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: mycontentPadding,
          child: Center(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  child: Icon(
                    UniconsLine.user,
                    size: 120,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_circle),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
