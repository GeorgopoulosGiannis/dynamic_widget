import 'package:flutter/material.dart';

import 'dynamic_widget.dart';

import 'dynamic_widget/widgets/preview_target.dart';

class DynamicDesignerWidgetBuilder extends DynamicWidgetBuilder {
  Widget? buildFromMap(
    Map<String, dynamic>? map,
    BuildContext buildContext,
    ClickListener? listener,
  ) {
    final widget = super.buildFromMap(map, buildContext, listener);
    if (widget != null) {
      return PreviewTarget(
        child: widget,
      );
    }

    return widget;
  }
}
