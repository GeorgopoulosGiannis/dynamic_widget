import 'package:flutter/material.dart';

import '../../dynamic_widget.dart';

class TextFieldWidgetParser extends WidgetParser {
  @override
  String get widgetName => 'TextField';

  @override
  Type get widgetType => TextField;

  @override
  Map<String, dynamic>? export(Widget? widget, BuildContext? buildContext) {
    final realWidget = widget as TextField;
    return {
      'type': widgetName,
      // '':realWidget.decoration TODO
    };
  }

  @override
  Widget parse(
    Map<String, dynamic> map,
    BuildContext buildContext,
    ClickListener? listener,
  ) {
    // TODO
    return TextField();
  }
}
