import 'package:evote/utils/dimensions.dart';

import 'package:flutter/widgets.dart';

class EvoteSizedBox extends StatelessWidget {
  final double height;
  final double width;
  final Widget? child;

  const EvoteSizedBox({Key? key, this.height = 0, this.width = 0, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizer = EvoteScaleUtil(context).sizer;
    return SizedBox(
      height: sizer.setHeight(height),
      width: sizer.setWidth(width),
      child: child,
    );
  }
}
