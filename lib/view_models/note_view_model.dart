
import 'dart:collection';

import 'package:blog/view_models/user_view_model.dart';
import 'package:flutter/cupertino.dart';

import '../models/note_model.dart';
import '../services/git_it_service_locator.dart';
import '../services/local_storage_service.dart';

final userViewModel = sl.get<UserViewModel>();

class NoteViewModel extends ChangeNotifier{
  final List<NoteModel> _notes = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> fetchNotes() async{
    _notes.clear();
    _isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    final fetchedNotes = await sl.get<LocalStorageService>().read('notes');
    _notes.addAll(NoteModel.decode(fetchedNotes?? ''));
    _isLoading = false;
    notifyListeners();
  }

  set setNote(Map<String, dynamic> result){
    _notes.insert(0, NoteModel.fromJson({...result, 'date': DateTime.now().toString(), 'username': userViewModel.getUsername}));
    notifyListeners();
    storeToLocal();
  }

  UnmodifiableListView<NoteModel> get getNotes => UnmodifiableListView(_notes);
  int get notesCount => _notes.length;

  void updateNote(int index, Map<String, dynamic> result) async{
    final newNote = _notes[index].copyWith(title: result['title'], content: result['content']);
    _notes[index] = newNote;
    notifyListeners();
    storeToLocal();
  }

  void removeNote(int index){
    _notes.removeAt(index);
    notifyListeners();
    storeToLocal();
  }


  void storeToLocal() async{
    await sl.get<LocalStorageService>().write('notes', NoteModel.encode(_notes));
  }

}