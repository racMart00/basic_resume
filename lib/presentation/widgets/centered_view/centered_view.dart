import 'package:flutter/material.dart';

class CenteredView extends StatelessWidget {

  const CenteredView({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.06,
        vertical: size.width * 0.001,
      ),
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: size.width),
        child: child,
      ),
    );
  }
}
