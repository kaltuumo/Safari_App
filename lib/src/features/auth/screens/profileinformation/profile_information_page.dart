// file: personal_info_page.dart
import 'package:flutter/material.dart';
import 'package:safari_app/src/features/auth/screens/createpassword/create_new_password.dart';
import 'package:safari_app/src/features/pages/screens/profile/profile_page.dart';
import 'package:safari_app/src/shared/app_button.dart';
import 'package:safari_app/src/utils/constant/colors.dart';

class ProfileInformationPage extends StatefulWidget {
  const ProfileInformationPage({super.key});

  @override
  State<ProfileInformationPage> createState() => _ProfileInformationPage();
}

class _ProfileInformationPage extends State<ProfileInformationPage> {
  String? selectedGender;
  String? selectedLocation;

  final List<String> genders = ["Male", "Female", "Other"];
  final List<String> locations = ["Mogadishu", "Nairobi"];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.08,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfilePage(),
                    ),
                  );
                },
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 25,
                  color: Color(0xFF111827),
                ),
              ),

              SizedBox(height: height * 0.025),
              // Title
              Text(
                "Profile Information",
                style: TextStyle(
                  fontSize: width * 0.07,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black, // ✅ Use AppColors
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Please complete the registration form first",
                style: TextStyle(
                  color: AppColors.grey, // ✅ Use AppColors
                  fontSize: 14,
                  height: 1.5,
                ),
              ),

              SizedBox(height: height * 0.03),

              // Full Name
              Text(
                "Full Name",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: height * 0.015),
                width: double.infinity,
                height: height * 0.061,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: AppColors.grey.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: width * 0.025),
                    const Expanded(
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Enter Full Name",
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Phone Number
              Text(
                "Phone Number",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: height * 0.015),
                width: double.infinity,
                height: height * 0.061,
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: AppColors.grey.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Text(
                      "🇸🇴 +252",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                    ),
                    Container(
                      height: 24,
                      width: 1,
                      color: AppColors.grey.withOpacity(0.3),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                    Expanded(
                      child: const TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Enter your phone number",
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Email
              Text(
                "Email Address",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: height * 0.015),
                width: double.infinity,
                height: height * 0.061,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: AppColors.grey.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    SizedBox(width: width * 0.025),
                    const Expanded(
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "Enter Email Address",
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Location Dropdown
              Text(
                "Location",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: height * 0.015),
                width: double.infinity,
                height: height * 0.061,
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: AppColors.grey.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: const Text("Select Location"),
                    value: selectedLocation,
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        selectedLocation = value;
                      });
                    },
                    items: locations.map((loc) {
                      return DropdownMenuItem<String>(
                        value: loc,
                        child: Text(loc),
                      );
                    }).toList(),
                  ),
                ),
              ),

              // Gender Dropdown
              Text(
                "Gender",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: height * 0.015),
                width: double.infinity,
                height: height * 0.061,
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: AppColors.grey.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: const Text("Select Gender"),
                    value: selectedGender,
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    },
                    items: genders.map((gender) {
                      return DropdownMenuItem<String>(
                        value: gender,
                        child: Text(gender),
                      );
                    }).toList(),
                  ),
                ),
              ),

              SizedBox(height: height * 0.02),

              // Save Button
              Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.01),
                width: double.infinity,
                height: height * 0.061,
                child: AppButton(
                  text: "Save",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateNewPassword(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
