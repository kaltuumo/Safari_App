import 'package:flutter/material.dart';
import 'package:safari_app/src/features/pages/screens/home/widget/check_rates_bottomsheet.dart';
import 'package:safari_app/src/shared/app_button.dart';
import 'package:safari_app/src/utils/constant/colors.dart';

class CheckRatesPage extends StatefulWidget {
  const CheckRatesPage({super.key});

  @override
  State<CheckRatesPage> createState() => _CheckRatesPageState();
}

class _CheckRatesPageState extends State<CheckRatesPage> {
  bool isParcel = true;
  String category = "Electronics";

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),

      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.07,
          vertical: width * 0.2,
        ),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context); // Dib ugu laab page-ka hore
                  },
                  borderRadius: BorderRadius.circular(999),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(999),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x12000000),
                          blurRadius: 14,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 18,
                      color: Color(0xFF111827),
                    ),
                  ),
                ),
                SizedBox(width: width * 0.2),
                Text(
                  "Check Rates",
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            _locationField(
              icon: Icons.location_on_outlined,
              hint: "Nairobi, Kenya",
              label: "Pick-up Point",
            ),

            const SizedBox(height: 12),
            _locationField(
              icon: Icons.location_on_outlined,
              hint: "Nairobi, Kenya",
              label: "Drop Off - Point",
            ),

            const SizedBox(height: 20),

            /// Shipment Type
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Shipment Type",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                shipmentButton(
                  title: "Parcel",
                  icon: Icons.inventory_2,
                  active: isParcel,
                  onTap: () => setState(() => isParcel = true),
                ),
                const SizedBox(width: 10),
                shipmentButton(
                  title: "Letter",
                  icon: Icons.mail_outline,
                  active: !isParcel,
                  onTap: () => setState(() => isParcel = false),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// Weight
            buildInputField(
              icon: Icons.scale_outlined,
              hint: "13.5 Kg",
              label: "Weight",
            ),

            const SizedBox(height: 20),

            /// Package Category
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Package Category",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  const Icon(Icons.not_accessible, color: Colors.grey),
                  const SizedBox(width: 10),
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: category,
                        isExpanded: true,
                        items: ["Electronics", "Clothes", "Documents"]
                            .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)),
                            )
                            .toList(),
                        onChanged: (v) => setState(() => category = v!),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: height * 0.061,
              child: AppButton(
                text: "Continue",
                onPressed: () {
                  showCheckRatesBottomSheet(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _locationField({
    required IconData icon,
    required String label,
    required String hint,
  }) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ),

        const SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.03,
            vertical: height * 0.015,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey.shade100, width: 1),
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.grey),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  hint,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ),
              const Icon(
                Icons.my_location_outlined,
                color: Colors.grey,
                size: 20,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildInputField({
    required IconData icon,
    required String hint,
    required String label,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.grey),
              const SizedBox(width: 10),
              Text(hint, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ],
    );
  }

  Widget shipmentButton({
    required String title,
    required IconData icon,
    required bool active,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: active ? const Color(0xffFFA726) : Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: active ? Colors.white : Colors.grey),
              const SizedBox(width: 6),
              Text(
                title,
                style: TextStyle(
                  color: active ? Colors.white : Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
