import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:pet_app/controller/screen_controller/history/history_controller.dart';
import 'package:pet_app/view/history/adoption_history_screen.dart';
import 'package:pet_app/view/home/pet_card_widget.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('AdoptionHistoryScreen displays list of adopted pets', (WidgetTester tester) async {
    /// Initialize the controller
    HistoryController historyController = Get.put(HistoryController());
    historyController.initializeAdoptedPets();

    /// Build the widget
    await tester.pumpWidget(
      GetMaterialApp(
        home: AdoptionHistoryScreen(),
      ),
    );

    /// Wait for the widget to build
    await tester.pumpAndSettle();

    /// Verify that the list of adopted pets is displayed
    expect(find.byType(ListView), findsOneWidget);
  });
}