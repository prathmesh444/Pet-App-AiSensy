import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_app/controller/screen_controller/history/history_controller.dart';
import 'package:pet_app/view/helper/colors/app_colors.dart';
import 'package:pet_app/view/helper/dimensions.dart';
import 'package:pet_app/view/helper/widgets/text.dart';
import 'package:pet_app/view/home/pet_card_widget.dart';

class AdoptionHistoryScreen extends StatefulWidget {
  const AdoptionHistoryScreen({super.key});

  @override
  State<AdoptionHistoryScreen> createState() => _AdoptionHistoryScreenState();
}

class _AdoptionHistoryScreenState extends State<AdoptionHistoryScreen> {

  HistoryController controller = Get.put(HistoryController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((duration){
      controller.initializeAdoptedPets();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const BuildText(text: 'Adoption History', size: Dimensions.fontSize_18sp, color: AppColors.whiteColor,),
            backgroundColor: AppColors.purpleColor,
          ),
          body: ListView.builder(
            itemCount: controller.adoptedPet.length,
            itemBuilder: (context, index) {
              return PetCard(
                  isHistory: true,
                  pet: controller.adoptedPet[index],
                  petIndex: index,
                  onTapCard: () => {}
              );
            },
          ),
        );
      }
    );
  }
}
