import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class ContainerNavigator extends StatelessWidget {
  const ContainerNavigator({
    super.key,
    required this.openBuilder,
    required this.closedBuilder,
  });

  final Widget Function(BuildContext, void Function({Object? returnValue})) openBuilder;
  final Widget Function(BuildContext, void Function()) closedBuilder;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      openShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        side: BorderSide(color: Colors.transparent),
      ),
      closedElevation: 0,
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        side: BorderSide(color: Colors.transparent),
      ),
      openElevation: 0,
      openBuilder: openBuilder,
      closedBuilder: closedBuilder,
    );
  }
}
