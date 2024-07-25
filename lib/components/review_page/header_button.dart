import 'package:flutter/material.dart';

class HeaderButton extends StatelessWidget {
  const HeaderButton({
    required this.title,
    required this.onPressed,
    this.isDisabled = false,
    super.key,
  });

  final String title;
  final VoidCallback onPressed;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        child: Text(title),
      ),
    ));
  }
}
