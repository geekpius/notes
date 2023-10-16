

import 'dart:io';

import 'package:intl/intl.dart';

class HelperUtil{

  static bool get isIOS => Platform.isIOS;

  static String getFormattedDate(DateTime date){
    return DateFormat('dd-MMM-yyyy - h:m a').format(date);
  }

}