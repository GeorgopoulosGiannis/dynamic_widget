import 'package:flutter/material.dart';
import 'package:soft1_presentation/soft1_presentation.dart';

import '../../dynamic_widget.dart';
import '../utils.dart';

class ConstrainedBoxWidgetParser extends WidgetParser {
  @override
  String get widgetName => 'ConstrainedBox';

  @override
  Type get widgetType => ConstrainedBox;
  @override
  Map<String, dynamic>? export(Widget? widget, BuildContext? buildContext) {
    final realWidget = widget as ConstrainedBox;
    return {
      'type': widgetName,
      'constraints': exportConstraints(realWidget.constraints),
      'child': DynamicWidgetBuilder.export(realWidget.child, buildContext),
    };
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext, ClickListener? listener) {
    return ConstrainedBox(
      constraints: parseBoxConstraints(map['constraints']),
      child: sl<DynamicWidgetBuilder>().buildFromMap(map['child'], buildContext, listener),
    );
  }
}
