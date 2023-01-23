import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:notekeeper/models/note.dart';

class DatabaseHelper {
  static late  DatabaseHelper _databaseHelper;
  DatabaseHelper._createInstance();
  Factory DatabaseHelper(){
    if(_databaseHelper==null ){
 _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }
}
