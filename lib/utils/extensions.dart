import 'package:evote/utils/dimensions.dart';

import 'package:flutter/widgets.dart';

extension ScaleExtension on BuildContext {
  EvoteScaleUtil get scaler {
    return EvoteScaleUtil(this);
  }
}

extension WidgetExtensions on Widget {
  List<Widget> operator *(int count) {
    return List.generate(count, (_) => this);
  }
}
