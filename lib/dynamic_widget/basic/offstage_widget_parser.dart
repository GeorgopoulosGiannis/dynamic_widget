import 'package:flutter/cupertino.dart';
import 'package:soft1_presentation/soft1_presentation.dart';
import '../../dynamic_widget.dart';

class OffstageWidgetParser extends WidgetParser {
  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    Offstage realWidget = widget as Offstage;
    return <String, dynamic>{
      "type": widgetName,
      "offstage": realWidget.offstage,
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext, ClickListener? listener) {
    return Offstage(
      offstage: map.containsKey("offstage") ? map['offstage'] : true,
      child: sl<DynamicWidgetBuilder>().buildFromMap(map['child'], buildContext, listener),
    );
  }

  @override
  String get widgetName => "Offstage";

  @override
  Type get widgetType => Offstage;
}
