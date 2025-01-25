
import 'package:get_storage/get_storage.dart';
import 'package:pet_app/controller/project_controler/myApp/petApp.dart';
import 'package:flutter/material.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const PetApp());
}
