import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pet_app/controller/project_controler/route/route_navigation.dart';
import 'package:pet_app/data/models/pet.dart';
import 'package:pet_app/data/repository/pet_repository.dart';
import 'package:pet_app/view/helper/colors/app_colors.dart';
import 'package:pet_app/view/helper/dimensions.dart';
import 'package:pet_app/view/helper/print_log.dart';
import 'package:pet_app/view/helper/strings/app_strings.dart';
import 'package:pet_app/view/helper/widgets/button.dart';
import 'package:pet_app/view/helper/widgets/text.dart';

class HomeController extends GetxController{

  PagingController<int, Pet> pagingController = PagingController(firstPageKey: 0);
  bool fetchingPets = false;
  bool listEnded = false;

  fetchPets({int page = 0, int pageSize = 10}) async {
    try {
      List<Pet> newPetList = PetRepo.getPetsPaginated(offset: page, limit: pageSize);
      PrintLog.printLog("Length of fetched pets: ${newPetList.length}");
      final isLastPage = newPetList.length < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newPetList);
      } else {
        pagingController.appendPage(newPetList, page+1);
      }
    } catch (error) {
      PrintLog.printLog("Error in fetching pets: $error");
      pagingController.error = error;
    }
  }

  changefetchingPets(bool value){
    PrintLog.printLog("Fetching pets: $value");
    fetchingPets = value;
    update();
  }

  void filterPets(String value) {
    if(value.isEmpty) {
      pagingController.refresh();
    } else {
      List<Pet>? filteredPets = pagingController.value.itemList?.where((element) => element.toString().toLowerCase().contains(value.toLowerCase())).toList();
      pagingController.value = PagingState<int, Pet>(
        itemList: [],
        error: null,
        nextPageKey: 0,
      );
      PrintLog.printLog("Filtered pets: ${filteredPets?.length}");
      pagingController.appendPage(filteredPets ?? [], 10);
      PrintLog.printLog("Paging controller pets: ${pagingController.itemList?.length}");
    }
    update();
  }

  void onClickAdoption({
    required Pet pet,
    required BuildContext context,
    required ConfettiController confettiController,
    index
  }) async {
    PetRepo.markAsAdopted(petId: pet.id);
    confettiController.play();
    await showDailogForAdoption(context, pet.name, confettiController);
    Get.back(result: pet);
  }

  Future<void> showDailogForAdoption(BuildContext context, String petName, ConfettiController controller) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BuildText(
                  text: AppString.kCongratulations,
                  size: Dimensions.fontSize_14sp,
                ),
                BuildText(
                  text: "${AppString.kAdoptedSuccess} ${petName}",
                  size: Dimensions.fontSize_14sp,
                ),
              ],
            ),
            actions: [
              BtnCustom(
                onPress: (){
                  controller.stop();
                  Get.back(closeOverlays: true);
                },
                title: "OK",
              )
            ],
          );
        }
    );
  }

  void updatePetDetails({required int filterPetIndex,required Pet pet}) {
   try{
     pagingController.itemList?[filterPetIndex] = pet;
     update();
   }
   catch (e){
     PrintLog.printLog("ERROR in updating Pet details in filteredPets and _pets $e");
   }
  }

}