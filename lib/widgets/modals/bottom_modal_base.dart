
import 'package:flutter/material.dart';

class BottomModalBase extends StatelessWidget {
  const BottomModalBase({
    super.key,
    required this.builder,
  });

  final Widget Function(BuildContext, ScrollController) builder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        Navigator.pop(context);
      },
      child: GestureDetector(
          onTap: (){},
          child: DraggableScrollableSheet(
            initialChildSize: 0.7,
            minChildSize: 0.7,
            builder: builder,
          ),
      ),
    );
  }
}
