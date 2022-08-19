import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:soft1_presentation/soft1_presentation.dart';
import '../../../dynamic_widget.dart';

class PageBaseParser extends WidgetParser {
  @override
  String get widgetName => 'PageBase';

  @override
  Type get widgetType => PageBase;
  @override
  Map<String, dynamic>? export(Widget? widget, BuildContext? buildContext) {
    final realWidget = widget as PageBase;
    final barActions = DynamicWidgetBuilder.exportWidgets(
      realWidget.barActions ?? [],
      buildContext,
    );

    final barColor = realWidget.barColor != null ? realWidget.barColor!.value.toRadixString(16) : null;
    return {
      'type': widgetName,
      'automaticallyImplyLeading': realWidget.automaticallyImplyLeading,
      'barActions': barActions,
      'barColor': barColor,
      'bottomNavbar': DynamicWidgetBuilder.export(realWidget.bottomNavbar, buildContext),
      'centerTitle': realWidget.centerTitle,
      'drawer': DynamicWidgetBuilder.export(realWidget.drawer, buildContext),
      'extraWidget': realWidget.extraWidget,
      'floatingActionButton': DynamicWidgetBuilder.export(
        realWidget.floatingActionButton,
        buildContext,
      ),
      'leading': DynamicWidgetBuilder.export(
        realWidget.leading,
        buildContext,
      ),
      'pageBody': DynamicWidgetBuilder.export(
        realWidget.pageBody,
        buildContext,
      ),
      'pageTitle': realWidget.pageTitle,
      'showAppbar': realWidget.showAppbar,
      'pinned': realWidget.pinned,
    };
  }

  @override
  Widget parse(Map<String, dynamic> map, BuildContext buildContext, ClickListener? listener) {
    return PageBase(
      automaticallyImplyLeading: map['automaticallyImplyLeading'],
      barActions: sl<DynamicWidgetBuilder>().buildWidgets(map['barActions'], buildContext, listener),
      barColor: map['barColor'],
      bottomNavbar: sl<DynamicWidgetBuilder>().buildFromMap(map['bottomNavbar'], buildContext, listener),
      centerTitle: map['centerTitle'],
      drawer: sl<DynamicWidgetBuilder>().buildFromMap(
        map['drawer'],
        buildContext,
        listener,
      ),
      extraWidget: map['extraWidget'],
      floatingActionButton: sl<DynamicWidgetBuilder>().buildFromMap(
        map['floatingActionButton'],
        buildContext,
        listener,
      ),
      leading: sl<DynamicWidgetBuilder>().buildFromMap(
        map['leading'],
        buildContext,
        listener,
      ),
      pageBody: sl<DynamicWidgetBuilder>().buildFromMap(
        map['pageBody'],
        buildContext,
        listener,
      ),
      pageTitle: map['pageTitle'],
      showAppbar: map['showAppbar'],
      pinned: map['pinned'],
    );
  }
}
