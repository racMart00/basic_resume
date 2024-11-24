import 'package:flutter/material.dart';

class CallToAction extends StatelessWidget {
  const CallToAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(
              Colors.deepPurple.shade600,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric( horizontal: 12, vertical: 6),
            child: Text(
              'Hire Me',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400
              ),
            ),
          ),
        ),
        SizedBox(width: 10,),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(
              Theme.of(context).colorScheme.inverseSurface,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric( horizontal: 12, vertical: 6),
            child: Text(
              'My work',
              style: TextStyle(
                color: Theme.of(context).colorScheme.surface,
                fontSize: 18,
                fontWeight: FontWeight.w800
              ),
            ),
          ),
        ),
      ],
    );
  }
}