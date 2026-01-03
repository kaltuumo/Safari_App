// lib/features/home/widgets/new_shipment_bottom_sheet.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safari_app/src/features/pages/screens/home/trackingDetails/tracking_details_page.dart';

import 'choice_card.dart';
import 'package:safari_app/src/utils/constant/images.dart';

enum ShipmentType { domestic, international }

Future<ShipmentType?> showNewShipmentBottomSheet(BuildContext context) {
  ShipmentType? selected;

  return showModalBottomSheet<ShipmentType>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (ctx) {
      return StatefulBuilder(
        builder: (context, setState) {
          return SafeArea(
            top: false,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 14, 20, 18),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 56,
                      height: 5,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE6E6E6),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "New Shipment",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Where are you sending the Order?",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF6B7280),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Row(
                      children: [
                        Expanded(
                          child: ChoiceCard(
                            title: "Domestic",
                            imagePath: AppImages.map,
                            isSelected: selected == ShipmentType.domestic,
                            onTap: () {
                              setState(() => selected = ShipmentType.domestic);
                              Get.to(() => const TrackingDetailsPage());
                            },
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: ChoiceCard(
                            title: "International",
                            imagePath: AppImages.world,
                            isSelected: selected == ShipmentType.international,
                            onTap: () {
                              setState(
                                () => selected = ShipmentType.international,
                              );
                              Get.to(() => const TrackingDetailsPage());
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
