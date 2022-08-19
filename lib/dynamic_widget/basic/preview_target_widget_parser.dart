import 'package:flutter/src/widgets/framework.dart';
import 'package:soft1_presentation/soft1_presentation.dart';

import '../../dynamic_widget.dart';
import '../widgets/preview_target.dart';

class PreviewTargetWidgetParser extends WidgetParser {
  @override
  String get widgetName => 'PreviewTarget';

  @override
  Type get widgetType => PreviewTarget;

  @override
  Map<String, dynamic>? export(Widget? widget, BuildContext? buildContext) {
    final realWidget = widget as PreviewTarget;
    return {
      'type': widgetName,
      'child': DynamicWidgetBuilder.export(realWidget.child, buildContext),
    };
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext, ClickListener? listener) {
    return PreviewTarget(
      child: sl<DynamicWidgetBuilder>().buildFromMap(map['child'], buildContext, listener),
    );
  }
}
