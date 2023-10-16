import 'package:blog/extensions/widgets/flexible_extension.dart';
import 'package:blog/extensions/widgets/padding_extension.dart';
import 'package:blog/extensions/widgets/text_extension.dart';
import 'package:blog/models/note_model.dart';
import 'package:blog/view_models/user_view_model.dart';
import 'package:blog/views/note_detail_view.dart';
import 'package:blog/widgets/common/container_navigator.dart';
import 'package:blog/widgets/common/horizontal_space.dart';
import 'package:flutter/material.dart';
import '../../services/git_it_service_locator.dart';
import '../../utils/constants.dart';
import '../../utils/helper_util.dart';
import 'context_menu_dropdown.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({
    Key? key,
    required this.note,
    required this.animation,
    required this.index,
    required this.openEditModal,
    required this.removeNote,
  }) : super(key: key);

  final NoteModel note;
  final Animation<double> animation;
  final void Function(int) openEditModal;
  final int index;
  final void Function(int, NoteModel) removeNote;

  @override
  Widget build(BuildContext context) {
    final userViewModel = sl.get<UserViewModel>();
    return SizeTransition(
      sizeFactor: animation,
      child: ContainerNavigator(
        openBuilder: (context, _) => NoteDetailView(note: note),
        closedBuilder: (context, openContainer) {
          return ListTile(
            onTap: openContainer,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(note.title).semiBold().fontSize(16).color(kNoteBlack).overflowText(TextOverflow.ellipsis).flexible(),
                    const HorizontalSpace(width: 8.0),
                    if(userViewModel.forLoggedInUser(note.username)) ContextMenuDropdown(
                      items: const [
                        {'value': '1', 'name': 'Edit Note', 'icon': Icon(
                          Icons.edit,
                          color: Colors.blue,
                          size: 24.0,
                        )},
                        {'value': '2', 'name': 'Delete Note', 'icon': Icon(
                          Icons.delete,
                          color: kError500,
                          size: 24.0,
                        )},
                      ],
                      onChanged: (value) async{
                        if(value == '1'){
                          openEditModal.call(index);
                          return;
                        }
                        if(value == '2'){
                          removeNote.call(index, note);
                          return;
                        }
                      },
                    ),
                  ],
                ),
                Text(note.content).regular().fontSize(14).color(kNoteBlack).overflowText(TextOverflow.ellipsis).flexible(),
              ],
            ),
            subtitle: Text(HelperUtil.getFormattedDate(note.date)).regular().fontSize(12).color(kNoteBlack).paddingOnly(top: 12),
          );
        }
      ),
    );
  }
}
