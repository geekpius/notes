
import 'package:blog/extensions/widgets/align_extension.dart';
import 'package:blog/extensions/widgets/padding_extension.dart';
import 'package:blog/extensions/widgets/text_extension.dart';
import 'package:blog/models/note_model.dart';
import 'package:blog/utils/app_dialog_util.dart';
import 'package:blog/utils/app_navigator_util.dart';
import 'package:blog/utils/constants.dart';
import 'package:blog/view_models/note_view_model.dart';
import 'package:blog/view_models/user_view_model.dart';
import 'package:blog/widgets/common/app_lottie.dart';
import 'package:blog/widgets/common/horizontal_space.dart';
import 'package:blog/widgets/common/note_tile.dart';
import 'package:flutter/material.dart';

import '../services/git_it_service_locator.dart';
import '../widgets/common/vertical_space.dart';
import '../widgets/modals/create_or_edit_note_bottom_modal.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final animatedListKey = GlobalKey<AnimatedListState>();
  final noteViewModel = sl.get<NoteViewModel>();
  final userViewModel = sl.get<UserViewModel>();

  @override
  void initState() {
    userViewModel.addListener(() => setState(() {}) );
    noteViewModel.addListener(() => setState(() {}) );
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      await noteViewModel.fetchNotes();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kNoteBlack,
      appBar: AppBar(
        backgroundColor: kNoteBlack,
        automaticallyImplyLeading: false,
        title: const Text('Notie').semiBold().fontSize(16).color(kPrimaryWhite),
        actions: [
          GestureDetector(
            onTap: (){
              if(userViewModel.isLoggedIn){
                userViewModel.logout(context);
                return;
              }
              AppNavigatorUtil.pushNamed(context, AppRoute.loginView);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.login,
                  size: 16.0,
                  color: kPrimaryWhite,
                ),
                const HorizontalSpace(width: 4.0),
                Text(userViewModel.isLoggedIn? 'Log Out':'Sign In').regular().fontSize(14).color(kPrimaryWhite).paddingOnly(right: 24.0)
              ],
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Builder(
          builder: (context) {
            if(noteViewModel.isLoading) {
              return const Center(child: AppLottie(fileName: 'loader.json'));
            }

            if(noteViewModel.notesCount == 0) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.notes,
                    color: kPrimaryWhite,
                    size: 24.0,
                  ),
                  const VerticalSpace(height: 12.0),
                  const Text('No note available').semiBold().fontSize(16).color(kPrimaryWhite).alignCenter(),
                ],
              ).paddingOnly(bottom: 32);
            }

            return AnimatedList(
              key: animatedListKey,
              initialItemCount: noteViewModel.notesCount,
              itemBuilder: (context, index, animation) {
                final note = noteViewModel.getNotes[index];
                return NoteTile(
                  key: UniqueKey(),
                  note: note,
                  animation: animation,
                  index:index,
                  openEditModal: openEditModal,
                  removeNote: removeNote,
                ).paddingOnly(bottom: 16.0);
              },
            ).paddingSymmetric(horizontal: 16);
          }
        ),
      ),

      floatingActionButton: userViewModel.isLoggedIn ? FloatingActionButton(
        backgroundColor: kOrange,
        onPressed: () async{
          final result = await AppDialogUtil.showScrollableBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return const CreateOrEditBottomModal();
            },
          );

          if(result != null){
            noteViewModel.setNote = result;
            animatedListKey.currentState?.insertItem(0);
          }
        },
        child: const Icon(Icons.add),
      ) : null,
    );
  }

  void openEditModal(index) async{
    final result = await AppDialogUtil.showScrollableBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return CreateOrEditBottomModal(updating: true, note: noteViewModel.getNotes[index],);
      },
    );

    if(result != null){
      noteViewModel.updateNote(index, result);
    }
  }

  void removeNote(int index, NoteModel note){
    animatedListKey.currentState!.removeItem(index, (context, animation) => NoteTile(
      note: note,
      animation: animation,
      index: index,
      openEditModal: openEditModal,
      removeNote: removeNote,
    ));
    noteViewModel.removeNote(index);
  }

}
