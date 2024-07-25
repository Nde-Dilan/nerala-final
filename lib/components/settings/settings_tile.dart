import 'package:flutter/material.dart';
import 'package:flutter_flashcards/configs/palette.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    required this.title,
    required this.icon,
    required this.callback,
    super.key,
  });

  final Icon icon;
  final String title;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          height: 1,
          thickness: 1,
        ),
        ListTile(
          leading: icon,
          title: Text(
            title,
            style: TextStyle(
                color: Palette().black,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          onTap: callback,
        ),
      ],
    );
  }
}
