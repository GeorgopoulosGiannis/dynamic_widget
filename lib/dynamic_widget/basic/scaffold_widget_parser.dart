import 'package:flutter/material.dart';

import 'package:soft1_presentation/soft1_presentation.dart';

import '../../dynamic_widget.dart';
import '../utils.dart';

class ScaffoldWidgetParser extends WidgetParser {
  @override
  Map<String, dynamic> export(Widget? widget, BuildContext? buildContext) {
    var realWidget = widget as Scaffold;

    return <String, dynamic>{
      "type": widgetName,
      "body": DynamicWidgetBuilder.export(realWidget.body, buildContext),
      "appBar": DynamicWidgetBuilder.export(realWidget.appBar, buildContext),
      "floatingActionButton": DynamicWidgetBuilder.export(realWidget.floatingActionButton, buildContext),
      "backgroundColor":
          realWidget.backgroundColor != null ? realWidget.backgroundColor!.value.toRadixString(16) : null,
    };
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext, ClickListener? listener) {
    var scaffoldWidget = Scaffold(
      appBar: map.containsKey("appBar")
          ? sl<DynamicWidgetBuilder>().buildFromMap(map["appBar"], buildContext, listener) as PreferredSizeWidget?
          : null,
      body:
          map.containsKey("body") ? sl<DynamicWidgetBuilder>().buildFromMap(map["body"], buildContext, listener) : null,
      floatingActionButton: map.containsKey("floatingActionButton")
          ? sl<DynamicWidgetBuilder>().buildFromMap(map["floatingActionButton"], buildContext, listener)
          : null,
      backgroundColor: map.containsKey("backgroundColor") ? parseHexColor(map["backgroundColor"]) : null,
    );

    return scaffoldWidget;
  }

  @override
  String get widgetName => "Scaffold";

  @override
  Type get widgetType => Scaffold;
}
