import 'package:blog/extensions/widgets/text_extension.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import 'horizontal_space.dart';

class ContextMenuDropdown extends StatelessWidget {
  const ContextMenuDropdown({
    Key? key,
    this.onChanged,
    this.offset = const Offset(-134, -10),
    this.dropdownWidth,
    this.items = const [],
  }) : super(key: key);

  final void Function(String?)? onChanged;
  final Offset offset;
  final double? dropdownWidth;
  final List<Map<String, dynamic>> items;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: const Icon(
          Icons.more_vert_outlined,
          size: 24.0,
          color: kNoteBlack,
        ),
        items: items.map((obj) => DropdownMenuItem<String>(
            value: obj['value'],
            child: Row(
              children: [
                obj['icon'],
                const HorizontalSpace(width: 12.0),
                Text(
                  obj['name']?? '',
                ).regular().fontSize(14.0).color(kNoteBlack).textScale(1.0),
              ],
            ),
          ),
        ).toList(),
        onChanged: onChanged,
        dropdownStyleData: DropdownStyleData(
          width: dropdownWidth?? 152.0,
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: kPrimaryWhite,
          ),
          offset: offset,
        ),
      ),
    );
  }
}