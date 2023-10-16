
import 'package:blog/extensions/widgets/padding_extension.dart';
import 'package:blog/extensions/widgets/text_extension.dart';
import 'package:blog/models/note_model.dart';
import 'package:blog/utils/app_navigator_util.dart';
import 'package:blog/utils/constants.dart';
import 'package:blog/utils/helper_util.dart';
import 'package:blog/widgets/common/vertical_space.dart';
import 'package:flutter/material.dart';

class NoteDetailView extends StatefulWidget {
  const NoteDetailView({Key? key, required this.note,}) : super(key: key);

  final NoteModel note;

  @override
  State<NoteDetailView> createState() => _NoteDetailViewState();
}

class _NoteDetailViewState extends State<NoteDetailView> {
  final animatedListKey = GlobalKey<AnimatedListState>();
  List<NoteModel> notes = [];

  @override
  Widget build(BuildContext context) {
    final note = widget.note;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kNoteBlack,
      appBar: AppBar(
        backgroundColor: kNoteBlack,
        centerTitle: false,
        leading: IconButton(
          onPressed: () => AppNavigatorUtil.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20.0,
            color: kPrimaryWhite,
          ),
        ),
        title: Text(note.title).semiBold().fontSize(16).color(kPrimaryWhite),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Written on ${HelperUtil.getFormattedDate(note.date)}').regular().fontSize(12).color(kGrey400),
              const VerticalSpace(height: 16),
              Text(note.content).regular().fontSize(16).color(kPrimaryWhite),
              const VerticalSpace(height: 12),
            ],
          ),
        ).paddingSymmetric(horizontal: 16),
      ),
    );
  }
}
