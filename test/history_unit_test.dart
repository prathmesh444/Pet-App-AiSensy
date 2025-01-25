import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:pet_app/controller/screen_controller/history/history_controller.dart';
import 'package:pet_app/data/models/pet.dart';
import 'package:pet_app/data/repository/pet_repository.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('HistoryController Test', () {
    late HistoryController historyController;

    setUp(() {
      historyController = Get.put(HistoryController());
    });


    test('adoptedPet list should be sorted by adoptionDate in descending order', () {
      historyController.initializeAdoptedPets();
      List<Pet> adoptedPets = historyController.adoptedPet;
      for (int i = 0; i < adoptedPets.length - 1; i++) {
        expect(adoptedPets[i].adoptionDate.isAfter(adoptedPets[i + 1].adoptionDate), true);
      }
    });
  });
}