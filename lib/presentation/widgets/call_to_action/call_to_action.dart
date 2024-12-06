import 'package:flutter/material.dart';

class CallToAction extends StatelessWidget {
  const CallToAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CallToActionButton(
          title: 'Hire Me',
          color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
          textColor: Colors.white,
        ),
        SizedBox(width: 10),
        CallToActionButton(
          title: 'My Work',
          color: Theme.of(context).colorScheme.inverseSurface,
          textColor: Theme.of(context).colorScheme.surface,
        ),
      ],
    );
  }
}

class CallToActionButton extends StatelessWidget {
  final String title;
  final Color color;
  final Color textColor;

  const CallToActionButton({
    super.key,
    required this.color,
    required this.title, required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(color),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
