import 'package:evote/utils/typedefs.dart';
import 'package:flutter/widgets.dart';

class TelephoneInputListener extends StatelessWidget {
  final TextEditingController telController;
  final Widget child;
  final OnCheck<String> onChanged;

  TelephoneInputListener({
    required this.telController,
    required this.onChanged,
    required this.child,
  })  : assert(telController != null),
        assert(onChanged != null),
        assert(
          child != null,
        );

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: telController,
      builder: (context, TextEditingValue tel, _child) {
        if (!onChanged(tel.text)) {
          return child;
        }
        return _child!;
      },
      child: Offstage(),
    );
  }
}
