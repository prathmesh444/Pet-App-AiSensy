import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_app/controller/screen_controller/home/home_controller.dart';
import 'package:pet_app/data/models/pet.dart';
import 'package:pet_app/view/helper/dimensions.dart';
import 'package:pet_app/view/helper/font_styles.dart';
import 'package:pet_app/view/helper/sized_box_extension.dart';
import 'package:pet_app/view/helper/strings/app_strings.dart';

import '../helper/colors/app_colors.dart';
import '../helper/widgets/text.dart';

class PetDetailScreen extends StatefulWidget {
  final Pet pet;
  final int index;
  PetDetailScreen({
    super.key,
    required this.pet,
    required this.index,
  });

  @override
  State<PetDetailScreen> createState() => _PetDetailScreenState();
}

class _PetDetailScreenState extends State<PetDetailScreen> {
  HomeController homeController = Get.find();
  late ConfettiController confettiCtrl;
  @override
  void initState() {
    confettiCtrl = ConfettiController(duration: const Duration(seconds: 10));
    super.initState();
  }

  @override
  void dispose() {
    confettiCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color _buttonColor = widget.pet.adopted ? AppColors.greyColor : AppColors.purpleColor;
    return Material(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.transparentColor,
          leading: IconButton(
            icon:  Icon(Icons.arrow_back, color: AppColors.blackColor),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Pet Image
                  Center(
                    child: Hero(
                      tag: widget.pet.id,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          widget.pet.image,
                          width: 300,
                          height: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  PercentSizedBox.height(0.02),


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [

                        /// Pet Details
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BuildText(
                              text: widget.pet.name,
                              size: Dimensions.fontSize_32sp,
                              weight: FontWeight.w700,
                              color: AppColors.blackColor,
                            ),
                            PercentSizedBox.height(.005),
                            BuildText(
                              text: 'Breed: ${widget.pet.breed}',
                              size: Dimensions.fontSize_16sp,
                              color: AppColors.greyColor,
                            ),
                            PercentSizedBox.height(.005),
                            BuildText(
                              text: 'Color: ${widget.pet.color}',
                              size: Dimensions.fontSize_16sp,
                                color: AppColors.greyColor,
                            ),
                             PercentSizedBox.height(.005),
                            BuildText(
                              text: 'Age: ${widget.pet.age} years',
                               size: Dimensions.fontSize_16sp,
                                color: AppColors.greyColor,
                            ),
                          ],
                        ),


                        /// Price Section with Animation
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: Get.width * 0.25,
                              height: Get.width * 0.25,
                              child: Lottie.asset(
                                'assets/animations/donation_animation.json',
                                repeat: true,
                                fit: BoxFit.fitWidth,
                              ),
                            ),

                            BuildText(
                              text: '\$${widget.pet.price.toStringAsFixed(2)}',
                              size: Dimensions.fontSize_24sp,
                              weight: FontWeight.bold,
                              color: AppColors.greenColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                   PercentSizedBox.height(.05),


                  /// Animated Icons Row
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AnimatedIconWidget(
                          icon: Icons.pets,
                          label: 'Friendly',
                          color: AppColors.tealColor,
                        ),
                        AnimatedIconWidget(
                          icon: Icons.local_activity,
                          label: 'Playful',
                          color: AppColors.yellowColor,
                        ),
                        AnimatedIconWidget(
                          icon: Icons.health_and_safety,
                          label: 'Healthy',
                          color: AppColors.greenColor,
                        ),
                      ],
                    ),
                  ),
                  PercentSizedBox.height(.1),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        /// Handle Adoption
                        if(widget.pet.adopted == false) {
                          widget.pet.adopted = true;
                          homeController.onClickAdoption(
                              pet: widget.pet,
                              context: context,
                              confettiController: confettiCtrl
                          );
                        }
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                        width: Get.width * 0.85,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient:  (widget.pet.adopted == false) ? LinearGradient(
                            colors: [_buttonColor.withOpacity(0.4), _buttonColor.withOpacity(0.9)],
                          ) : null,
                          color: _buttonColor,
                          boxShadow: [
                            if(widget.pet.adopted == false)
                              BoxShadow(
                                color: _buttonColor.withOpacity(0.4),
                                blurRadius: 5,
                                offset: const Offset(0, 5),
                              ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.pets, color: AppColors.whiteColor),
                            PercentSizedBox.width(0.01),
                            BuildText(
                              text: widget.pet.adopted ?  AppString.kAdopted : AppString.kAdoptMe,
                              color: AppColors.whiteColor,
                              size: Dimensions.fontSize_18sp,
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  PercentSizedBox.height(.04),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ConfettiWidget(
                confettiController: confettiCtrl,
                blastDirectionality: BlastDirectionality.explosive,
                blastDirection: -pi / 2,
                emissionFrequency: 0.01,
                numberOfParticles: 80,
                maxBlastForce: 50,
                minBlastForce: 40,
                gravity: 0.3,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AnimatedIconWidget extends StatefulWidget {
  final IconData icon;
  final String label;
  final Color color;

  const AnimatedIconWidget({
    Key? key,
    required this.icon,
    required this.label,
    required this.color,
  }) : super(key: key);

  @override
  State<AnimatedIconWidget> createState() => _AnimatedIconWidgetState();
}

class _AnimatedIconWidgetState extends State<AnimatedIconWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScaleTransition(
          scale: _animation,
          child: Icon(widget.icon, color: widget.color, size: 40),
        ),
        PercentSizedBox.height(.01),
        BuildText(text: widget.label, size: Dimensions.fontSize_16sp),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
