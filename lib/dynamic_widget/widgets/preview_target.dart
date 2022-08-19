import '../../dynamic_widget.dart';

import 'package:flutter/material.dart';
import 'package:soft1_presentation/soft1_presentation.dart';

class PreviewTarget extends StatefulWidget {
  final Widget? child;
  const PreviewTarget({
    super.key,
    required this.child,
  });

  @override
  State<PreviewTarget> createState() => _PreviewTargetState();
}

class _PreviewTargetState extends State<PreviewTarget> {
  late Widget? child = widget.child;

  @override
  void initState() {
    print('init state $child');
    super.initState();
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  bool get acceptsChild => child is Flex || child == null;

  @override
  Widget build(BuildContext context) {
    if (!acceptsChild) {
      return child!;
    }
    return DragTarget<Map<String, dynamic>>(
      //hitTestBehavior: HitTestBehavior.deferToChild, //  HitTestBehavior.translucent,
      onAccept: (data) {
        print('acceoted $data');
      },
      onWillAccept: (data) => acceptsChild,
      onAcceptWithDetails: (details) {
        if (child is Flex) {
          final childJson = DynamicWidgetBuilder.export(child!, context);
          (childJson!['children'] as List).add(details.data);

          child = sl<DynamicWidgetBuilder>().buildFromMap(
            childJson,
            context,
            NonResponseWidgetClickListener(),
          )!;
          setState(() {});
          return;
        }
        child = sl<DynamicWidgetBuilder>().buildFromMap(
          details.data,
          context,
          NonResponseWidgetClickListener(),
        );
        print(child);

        setState(() {});
        print('onAcceptWithDetails $details');
      },
      onLeave: (data) {
        print('onLeaVE $data');
      },
      onMove: (details) {
        print(details);
      },
      builder: (context, candidateData, rejectedData) {
        if (child is Flex) {
          print((child as Flex).children);
        }
        if (child != null) {
          return DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 8,
                  color: Colors.blue,
                ),
              ),
              child: child);
        }
        return child ??
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 8,
                  color: Colors.red,
                ),
              ),
              child: SizedBox.shrink(),
            );
      },
    );
  }
}
