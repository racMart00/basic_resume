import 'package:flutter/material.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.width * 0.08,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white70,
              ),
              image: const DecorationImage(
                image: AssetImage(
                  'assets/icons/racmart_logo_512px.png',
                ),
              ),
            ),
          ),
          SizedBox(width: size.width * 0.01),
          Text("Hi! I'm_racMart",
              style: Theme.of(context).textTheme.displayMedium,),
        ],
      ),
    );
  }
}
