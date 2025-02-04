import 'package:flutter/material.dart';
import 'package:soft1_presentation/soft1_presentation.dart';
import '../../dynamic_widget.dart';
import '../utils.dart';

class LimitedBoxWidgetParser extends WidgetParser {
  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    LimitedBox realWidget = widget as LimitedBox;
    return <String, dynamic>{
      "type": widgetName,
      "maxWidth": realWidget.maxWidth == double.infinity ? infinity : realWidget.maxWidth,
      "maxHeight": realWidget.maxHeight == double.infinity ? infinity : realWidget.maxHeight,
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext, ClickListener? listener) {
    return LimitedBox(
      maxWidth: map.containsKey("maxWidth") ? map['maxWidth'] : double.infinity,
      maxHeight: map.containsKey("maxHeight") ? map['maxHeight'] : double.infinity,
      child: sl<DynamicWidgetBuilder>().buildFromMap(map['child'], buildContext, listener),
    );
  }

  @override
  String get widgetName => "LimitedBox";

  @override
  Type get widgetType => LimitedBox;
}
