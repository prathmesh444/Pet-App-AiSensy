import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet_app/data/models/pet.dart';
import 'package:pet_app/data/repository/pet_repository.dart';
import 'package:pet_app/view/helper/print_log.dart';

class HistoryController extends GetxController{
  List<Pet> adoptedPet = [];

  initializeAdoptedPets(){
    adoptedPet =  PetRepo.getAdoptedPrets()..sort((a, b) => b.adoptionDate.compareTo(a.adoptionDate));
    PrintLog.printLog("Adopted pets: ${adoptedPet.length}");
    update();
  }

}