import 'package:flutter/widgets.dart';
import 'package:soft1_presentation/soft1_presentation.dart';

import '../../dynamic_widget.dart';

//Creates a box that will become as large as its parent allows.
class ExpandedSizedBoxWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext, ClickListener? listener) {
    return SizedBox.expand(
      child: sl<DynamicWidgetBuilder>().buildFromMap(
        map["child"],
        buildContext,
        listener,
      ),
    );
  }

  @override
  String get widgetName => "ExpandedSizedBox";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    throw UnimplementedError();
  }

  /// user SizedBoxWidgetParser for ExpandedSizedBox
  @override
  Type get widgetType => UnimplementedType;
}

class SizedBoxWidgetParser extends WidgetParser {
  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext, ClickListener? listener) {
    return SizedBox(
      width: map["width"],
      height: map["height"],
      child: sl<DynamicWidgetBuilder>().buildFromMap(
        map["child"],
        buildContext,
        listener,
      ),
    );
  }

  @override
  String get widgetName => "SizedBox";

  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as SizedBox;
    return <String, dynamic>{
      "type": "SizedBox",
      "width": realWidget.width,
      "height": realWidget.height,
      "child": DynamicWidgetBuilder.export(realWidget.child, buildContext)
    };
  }

  @override
  Type get widgetType => SizedBox;
}

class UnimplementedType {}
