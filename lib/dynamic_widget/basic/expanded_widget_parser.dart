import 'package:flutter/widgets.dart';
import 'package:soft1_presentation/soft1_presentation.dart';
import '../../dynamic_widget.dart';

class ExpandedWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext, ClickListener? listener) {
    return Expanded(
      child: sl<DynamicWidgetBuilder>().buildFromMap(map["child"], buildContext, listener)!,
      flex: map.containsKey("flex") ? map["flex"] : 1,
    );
  }

  @override
  String get widgetName => "Expanded";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Expanded;
    return <String, dynamic>{
      "type": widgetName,
      "flex": realWidget.flex,
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Type get widgetType => Expanded;
}
