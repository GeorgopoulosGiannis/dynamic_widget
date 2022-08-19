import 'package:flutter/widgets.dart';
import 'package:soft1_presentation/soft1_presentation.dart';
import '../../dynamic_widget.dart';

class RotatedBoxWidgetParser extends WidgetParser {
  @override
  Map<String, dynamic>? export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as RotatedBox;
    return <String, dynamic>{
      "type": widgetName,
      "quarterTurns": realWidget.quarterTurns,
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext),
    };
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext, ClickListener? listener) {
    return RotatedBox(
      quarterTurns: map['quarterTurns'],
      child: sl<DynamicWidgetBuilder>().buildFromMap(map["child"], buildContext, listener),
    );
  }

  @override
  String get widgetName => "RotatedBox";

  @override
  Type get widgetType => RotatedBox;
}
