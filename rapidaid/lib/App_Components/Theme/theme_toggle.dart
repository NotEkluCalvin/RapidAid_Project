import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unicons/unicons.dart';

import 'theme_provider.dart';

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(UniconsLine.adjust_half),
      title: const Text('c h a n g e  t h e m e'),
      trailing: CupertinoSwitch(
        activeTrackColor: Theme.of(context).colorScheme.surface,
        value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
        onChanged: (value) =>
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
      ),
    );
  }
}

