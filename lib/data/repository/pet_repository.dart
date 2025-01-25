import 'package:get_storage/get_storage.dart';
import 'package:pet_app/data/models/pet.dart';
import 'package:pet_app/view/helper/print_log.dart';

class PetRepo{

  static List<Map<String, dynamic>> dummyPetData = [
    {
      "id": "PET001",
      "name": "Buddy",
      "age": 24,
      "price": 300.0,
      "adopted": false,
      "color": "Golden",
      "breed": "Golden Retriever",
      "image": "assets/images/dog_1.jpg",
      "adoptionDate": "2023-01-01T00:00:00.000Z"
    },
    {
      "id": "PET002",
      "name": "Charlie",
      "age": 36,
      "price": 400.0,
      "adopted": false,
      "color": "Brown",
      "breed": "Labrador Retriever",
      "image": "assets/images/dog_2.jpg",
      "adoptionDate": "2023-01-01T00:00:00.000Z"
    },
    {
      "id": "PET003",
      "name": "Max",
      "age": 48,
      "price": 500.0,
      "adopted": false,
      "color": "Black",
      "breed": "German Shepherd",
      "image": "assets/images/dog_3.jpg",
      "adoptionDate": "2023-01-01T00:00:00.000Z"
    },
    {
      "id": "PET004",
      "name": "Bella",
      "age": 30,
      "price": 350.0,
      "adopted": false,
      "color": "White",
      "breed": "Samoyed",
      "image": "assets/images/dog_4.jpg",
      "adoptionDate": "2023-01-01T00:00:00.000Z"
    },
    {
      "id": "PET005",
      "name": "Daisy",
      "age": 20,
      "price": 220.0,
      "adopted": false,
      "color": "Golden",
      "breed": "Cocker Spaniel",
      "image": "assets/images/dog_5.jpg",
      "adoptionDate": "2023-01-01T00:00:00.000Z"
    },
    {
      "id": "PET006",
      "name": "Jack",
      "age": 50,
      "price": 600.0,
      "adopted": false,
      "color": "Black and Tan",
      "breed": "Rottweiler",
      "image": "assets/images/dog_6.jpg",
      "adoptionDate": "2023-01-01T00:00:00.000Z"
    },
    {
      "id": "PET007",
      "name": "Rocky",
      "age": 60,
      "price": 450.0,
      "adopted": false,
      "color": "Brindle",
      "breed": "Boxer",
      "image": "assets/images/dog_7.jpg",
      "adoptionDate": "2023-01-01T00:00:00.000Z"
    },
    {
      "id": "PET008",
      "name": "Coco",
      "age": 22,
      "price": 320.0,
      "adopted": false,
      "color": "Brown",
      "breed": "Shih Tzu",
      "image": "assets/images/dog_8.jpg",
      "adoptionDate": "2023-01-01T00:00:00.000Z"
    },
    {
      "id": "PET009",
      "name": "Oliver",
      "age": 19,
      "price": 280.0,
      "adopted": false,
      "color": "White",
      "breed": "Bichon Frise",
      "image": "assets/images/dog_9.jpg",
      "adoptionDate": "2023-01-01T00:00:00.000Z"
    },
    {
      "id": "PET010",
      "name": "Bailey",
      "age": 32,
      "price": 450.0,
      "adopted": false,
      "color": "Black",
      "breed": "Doberman Pinscher",
      "image": "assets/images/dog_10.jpg",
      "adoptionDate": "2023-01-01T00:00:00.000Z"
    },
    {
      "id": "PET011",
      "name": "Ruby",
      "age": 18,
      "price": 390.0,
      "adopted": false,
      "color": "Gray",
      "breed": "Weimaraner",
      "image": "assets/images/dog_11.jpg",
      "adoptionDate": "2023-01-01T00:00:00.000Z"
    },
    {
      "id": "PET012",
      "name": "Zoe",
      "age": 14,
      "price": 300.0,
      "adopted": false,
      "color": "White",
      "breed": "Maltese",
      "image": "assets/images/dog_12.jpg",
      "adoptionDate": "2023-01-01T00:00:00.000Z"
    },
    {
      "id": "PET013",
      "name": "Milo",
      "age": 10,
      "price": 250.0,
      "adopted": false,
      "color": "Golden",
      "breed": "Beagle",
      "image": "assets/images/dog_13.jpg",
      "adoptionDate": "2023-01-01T00:00:00.000Z"
    },
    {
      "id": "PET014",
      "name": "Simba",
      "age": 16,
      "price": 400.0,
      "adopted": false,
      "color": "Orange",
      "breed": "Chow Chow",
      "image": "assets/images/dog_14.jpg",
      "adoptionDate": "2023-01-01T00:00:00.000Z"
    },
    {
      "id": "PET015",
      "name": "Luna",
      "age": 8,
      "price": 200.0,
      "adopted": false,
      "color": "Gray",
      "breed": "Italian Greyhound",
      "image": "assets/images/dog_15.jpg",
      "adoptionDate": "2023-01-01T00:00:00.000Z"
    },
    {
      "id": "PET016",
      "name": "Chloe",
      "age": 25,
      "price": 500.0,
      "adopted": false,
      "color": "Black and White",
      "breed": "Border Collie",
      "image": "assets/images/dog_16.jpg",
      "adoptionDate": "2023-01-01T00:00:00.000Z"
    },
    {
      "id": "PET017",
      "name": "Rex",
      "age": 45,
      "price": 550.0,
      "adopted": false,
      "color": "Black",
      "breed": "Great Dane",
      "image": "assets/images/dog_17.jpg",
      "adoptionDate": "2023-01-01T00:00:00.000Z"
    },
    {
      "id": "PET018",
      "name": "Maggie",
      "age": 12,
      "price": 300.0,
      "adopted": false,
      "color": "White and Brown",
      "breed": "Saint Bernard",
      "image": "assets/images/dog_18.jpg",
      "adoptionDate": "2023-01-01T00:00:00.000Z"
    },
    {
      "id": "PET019",
      "name": "Jojo",
      "age": 6,
      "price": 200.0,
      "adopted": false,
      "color": "White",
      "breed": "Bernard",
      "image": "assets/images/dog_19.jpg",
      "adoptionDate": "2023-01-01T00:00:00.000Z"
    },
    {
      "id": "PET020",
      "name": "Carry",
      "age": 17,
      "price": 500.0,
      "adopted": false,
      "color": "Black",
      "breed": "Shepherd",
      "image": "assets/images/dog_20.jpg",
      "adoptionDate": "2023-01-01T00:00:00.000Z"
    }
  ];

  static List<Pet> getPetsPaginated({required int offset, int limit = 10}){
    if(dummyPetData.length < (offset * limit)) return [];
    PrintLog.printLog("skip length:- ${dummyPetData.skip(offset).length} , take length:- ${dummyPetData.skip(offset).take(limit).length}");
    return dummyPetData.skip(offset * limit).take(limit).map((e) => Pet.fromJson(e)).toList();
  }

  static void markAsAdopted({required String petId}) {
    /// Dummy DB/API function
    final int petIndex = dummyPetData.indexWhere((element) => element["id"] == petId);
    GetStorage().write(petId, DateTime.now().toIso8601String());
    PrintLog.printLog("Pet index Adopted is : $petIndex");
    if(petIndex != -1) {
      dummyPetData[petIndex]["adopted"] = true;
      dummyPetData[petIndex]["adoptionDate"] = DateTime.now().toIso8601String();
    }
  }

  static List<Pet> getAdoptedPrets() {
    return dummyPetData.where((element) => GetStorage().hasData(element["id"])).map((e) => Pet.fromJson(e)).toList();
  }
}