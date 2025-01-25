
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pet_app/controller/project_controler/route/route_navigation.dart';
import 'package:pet_app/controller/screen_controller/home/home_controller.dart';
import 'package:pet_app/data/models/pet.dart';
import 'package:pet_app/view/details/pet_detail_screen.dart';
import 'package:pet_app/view/helper/colors/app_colors.dart';
import 'package:pet_app/view/helper/dimensions.dart';
import 'package:pet_app/view/helper/font_styles.dart';
import 'package:pet_app/view/helper/padding_values.dart';
import 'package:pet_app/view/helper/print_log.dart';
import 'package:pet_app/view/helper/sized_box_extension.dart';
import 'package:pet_app/view/helper/strings/app_strings.dart';
import 'package:pet_app/view/helper/widgets/text.dart';
import 'package:pet_app/view/home/pet_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  HomeController homeCtrl = Get.put(HomeController());
  TextEditingController searchCtrl = TextEditingController();
  @override
  void initState() {
      homeCtrl.pagingController.addPageRequestListener((pageKey) {
        homeCtrl.fetchPets(page: pageKey);
      });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: GetBuilder(
            init: homeCtrl,
            builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: PaddingValues.symmetric(horizontal: Dimensions.pad_16dp, vertical: Dimensions.pad_12dp),
                      child: SearchBar(
                        controller: searchCtrl,
                        padding: WidgetStatePropertyAll(PaddingValues.symmetric(horizontal: Dimensions.pad_16dp)),
                        leading: Icon(Icons.search, color: AppColors.greyColor,),
                        backgroundColor: WidgetStatePropertyAll(AppColors.whiteColor),
                        shadowColor: WidgetStatePropertyAll(AppColors.blackColor.withOpacity(0.5)),
                        elevation: WidgetStatePropertyAll(5),
                        hintText: AppString.kSearchYourPet,
                        hintStyle: WidgetStatePropertyAll(
                          CustomTextStyle.defaultStyle(
                            color: AppColors.greyColor,
                            weight: FontWeight.w300,
                            size: Dimensions.fontSize_14sp
                          )
                        ),
                        onChanged: (value){
                          Debouncer(delay: Duration(milliseconds: 300)).call((){
                            homeCtrl.filterPets(value);
                          });

                        },
                      )
                  ),
                  PercentSizedBox.height(0.02),
                  // homeCtrl.filteredPets.isEmpty
                  //     ? Center(
                  //   child: BuildText(
                  //     text: AppString.kNoPetFound,
                  //     size: Dimensions.fontSize_20sp,
                  //     weight: FontWeight.w700,
                  //     color: AppColors.purpleColor,
                  //   ),
                  // )
                  //     :

                  Expanded(
                    child: PagedListView<int, Pet>(
                        pagingController: homeCtrl.pagingController,
                        builderDelegate: PagedChildBuilderDelegate<Pet>(
                            itemBuilder: (context, item, index) => PetCard(
                              pet: item,
                              petIndex: index,
                              onTapCard: () async {
                                final updatedPet = await Get.toNamed(
                                    RouteNavigation.petDetailScreenRoute,
                                    arguments: PetDetailScreen(
                                        pet: item,
                                        index: index
                                    )
                                );
                                PrintLog.printLog("is Pet Updated on Back $updatedPet");
                                if(updatedPet != null && updatedPet is Pet) {
                                  homeCtrl.updatePetDetails(filterPetIndex: index, pet: updatedPet);
                                }
                              },
                            )
                        )
                    ),
                  )
                ],
              );
            }
          )
      ),
    );
  }

  _handlePagination() {

  }
}

