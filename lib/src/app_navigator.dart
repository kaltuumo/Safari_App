import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:safari_app/src/features/pages/screens/home/home_page.dart';
import 'package:safari_app/src/features/pages/screens/package/package_page.dart';
import 'package:safari_app/src/features/pages/screens/profile/profile_page.dart';
import 'package:safari_app/src/features/pages/screens/support/support_page.dart';
import 'package:safari_app/src/utils/constant/colors.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({super.key, this.initialIndex = 0});

  final int? initialIndex;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      _NavigationController(initialIndex: initialIndex ?? 0),
    );

    return Scaffold(
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 70,
          elevation: 0,
          backgroundColor: AppColors.white,
          indicatorColor: AppColors.secondaryColor.withOpacity(0.15),
          selectedIndex: controller.navIndex.value,
          onDestinationSelected: (index) {
            // 🔥 Scan button (center) – page ma bedelayso
            if (index == 2) {
              Get.snackbar(
                "Scan",
                "Scan button clicked",
                snackPosition: SnackPosition.BOTTOM,
              );
              return;
            }

            controller.changePage(index);
          },
          destinations: [
            const NavigationDestination(
              icon: Icon(Iconsax.home),
              label: 'Home',
            ),
            const NavigationDestination(
              icon: Icon(Iconsax.box),
              label: 'Package',
            ),

            /// 🔥 Scan Button (Middle)
            NavigationDestination(
              icon: Container(
                margin: const EdgeInsets.only(top: 18),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Iconsax.scan_barcode,
                  color: Colors.white,
                  size: 26,
                ),
              ),
              label: '',
            ),

            const NavigationDestination(
              icon: Icon(Iconsax.sms),
              label: 'Support',
            ),
            const NavigationDestination(
              icon: Icon(Iconsax.user),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}

/// ---------------- CONTROLLER ----------------
class _NavigationController extends GetxController {
  _NavigationController({this.initialIndex = 0}) {
    selectedIndex.value = initialIndex;
    navIndex.value = initialIndex < 2 ? initialIndex : initialIndex + 1;
  }

  final int initialIndex;

  /// index-ka dhabta ah ee pages
  final RxInt selectedIndex = 0.obs;

  /// index-ka NavigationBar (oo leh scan)
  final RxInt navIndex = 0.obs;

  final List<Widget> screens = const [
    HomePage(), // 0
    PackagePage(), // 1
    SupportPage(), // 2
    ProfilePage(), // 3
  ];

  void changePage(int index) {
    // index > 2 → hal boos ka bood scan
    selectedIndex.value = index > 2 ? index - 1 : index;
    navIndex.value = index;
  }
}
