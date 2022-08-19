import 'package:flutter/material.dart';
import 'package:soft1_presentation/soft1_presentation.dart';

import '../../dynamic_widget.dart';
import '../utils.dart';

class FloatingActionParser extends WidgetParser {
  @override
  String get widgetName => 'FloatingActionButton';

  @override
  Type get widgetType => FloatingActionButton;

  @override
  Map<String, dynamic>? export(Widget? widget, BuildContext? buildContext) {
    final realWidget = widget as FloatingActionButton;
    final bgColor = realWidget.backgroundColor != null
        ? realWidget.backgroundColor!.value.toRadixString(
            16,
          )
        : null;
    final splashColor = realWidget.splashColor != null
        ? realWidget.splashColor!.value.toRadixString(
            16,
          )
        : null;
    return {
      'type': widgetName,
      'clickListener': 'floatingActionButtonPressed',
      'child': DynamicWidgetBuilder.export(realWidget.child, buildContext),
      'backgroundColor': bgColor,
      'splashColor': splashColor,
      'elevation': realWidget.elevation
    };
  }

  @override
  Widget parse(
    Map<String, dynamic> map,
    BuildContext buildContext,
    ClickListener? listener,
  ) {
    final clickListener = map['clickListener'] as String?;
    final bgColor = parseHexColor(map['backgroundColor']);
    final splashColor = parseHexColor(map['splashColor']);
    final elevation = s1parse<double>(
      map['elevation'],
    );
    final child = sl<DynamicWidgetBuilder>().buildFromMap(map['child'], buildContext, listener);
    return FloatingActionButton(
      onPressed: clickListener != null ? () => listener?.onClicked(clickListener) : null,
      elevation: elevation,
      backgroundColor: bgColor,
      splashColor: splashColor,
      child: child,
    );
  }
}
