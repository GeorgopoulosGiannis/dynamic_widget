import 'package:flutter/widgets.dart';
import 'package:soft1_presentation/soft1_presentation.dart';
import '../../dynamic_widget.dart';

class OpacityWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext, ClickListener? listener) {
    return Opacity(
      opacity: map["opacity"]?.toDouble(),
      alwaysIncludeSemantics: map.containsKey("alwaysIncludeSemantics") ? map["alwaysIncludeSemantics"] : false,
      child: sl<DynamicWidgetBuilder>().buildFromMap(map["child"], buildContext, listener),
    );
  }

  @override
  String get widgetName => "Opacity";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Opacity;
    return <String, dynamic>{
      "type": widgetName,
      "opacity": realWidget.opacity,
      "alwaysIncludeSemantics": realWidget.alwaysIncludeSemantics,
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Type get widgetType => Opacity;
}
