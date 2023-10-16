
import 'package:blog/extensions/widgets/align_extension.dart';
import 'package:blog/extensions/widgets/expanded_extension.dart';
import 'package:blog/extensions/widgets/padding_extension.dart';
import 'package:blog/extensions/widgets/text_extension.dart';
import 'package:blog/widgets/common/vertical_space.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class BottomModalContent extends StatelessWidget {
  const BottomModalContent({
    super.key,
    required this.child,
    this.title,
  });

  final String? title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
            color: kPrimaryWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                  vertical: 16.0
              ),
              height: 4,
              width: 40,
              decoration: BoxDecoration(
                color: kGrey400,
                borderRadius: BorderRadius.circular(4),
              ),
            ).alignCenter(),

            Text(title?? '').semiBold().fontSize(18).color(kNoteBlack).paddingSymmetric(
                horizontal: 24.0
            ),
            const VerticalSpace(height: 12),

            child.expanded(),
          ],
        ),
      ),
    );
  }
}
