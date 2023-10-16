
import 'package:blog/view_models/note_view_model.dart';
import 'package:get_it/get_it.dart';

import '../view_models/user_view_model.dart';
import 'local_storage_service.dart';


GetIt sl = GetIt.instance;

void setUpGetItServiceLocator(){
  // GeocodingService
  sl.registerSingleton<LocalStorageService>(LocalStorageService());
  sl.registerSingleton<NoteViewModel>(NoteViewModel());
  sl.registerSingleton<UserViewModel>(UserViewModel());
}