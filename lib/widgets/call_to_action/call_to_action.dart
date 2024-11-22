import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'package:basic_resume/widgets/call_to_action/call_to_action_mobile.dart';
import 'package:basic_resume/widgets/call_to_action/call_to_action_tablet_desktop.dart';

class CallToAction extends StatelessWidget {
  final String title;

  const CallToAction({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => CallToActionMobile(title: title,),
      tablet: (BuildContext context) => CallToActionTabletDesktop(title: title,),
    );
  }
}
