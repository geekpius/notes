
import 'package:blog/extensions/widgets/padding_extension.dart';
import 'package:blog/models/note_model.dart';
import 'package:blog/utils/app_navigator_util.dart';
import 'package:blog/widgets/modals/bottom_modal_base.dart';
import 'package:blog/widgets/modals/bottom_modal_content.dart';
import 'package:flutter/material.dart';

import '../forms/app_input_field.dart';
import '../forms/app_primary_button.dart';

class CreateOrEditBottomModal extends StatefulWidget {
  const CreateOrEditBottomModal({super.key, this.updating = false, this.note,});

  final bool updating;
  final NoteModel? note;

  @override
  State<CreateOrEditBottomModal> createState() => _CreateOrEditBottomModalState();
}

class _CreateOrEditBottomModalState extends State<CreateOrEditBottomModal> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(widget.updating){
        titleController.text = widget.note?.title?? '';
        contentController.text = widget.note?.content?? '';
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BottomModalBase(
      builder: (context, scrollController){
        return BottomModalContent(
          title: widget.updating?'Edit Note':'Add New Note',
          child: SingleChildScrollView(
            controller: scrollController,
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppInputField(
                    hintText: 'Title',
                    controller: titleController,
                    validator: (value){
                      if(value!.isEmpty) return 'Title field is required';
                      return null;
                    },
                  ),
                  AppInputField(
                    hintText: 'Content',
                    controller: contentController,
                    maxLine: 5,
                    validator: (value){
                      if(value!.isEmpty) return 'Content field is required';
                      return null;
                    },
                  ),
                  AppPrimaryButton(
                    onPressed: (){
                      if(formKey.currentState!.validate()){
                        AppNavigatorUtil.pop(context, {
                          'title': titleController.text,
                          'content': contentController.text,
                        });
                      }else{
                        setState(() => autovalidateMode = AutovalidateMode.onUserInteraction );
                      }
                    },
                    text: widget.updating? 'Update':'Add New',
                    minWidth: double.infinity,
                  )
                ],
              ),
            ),
          ).paddingSymmetric(
              horizontal: 24.0
          ),
        );
      },
    );
  }
}
