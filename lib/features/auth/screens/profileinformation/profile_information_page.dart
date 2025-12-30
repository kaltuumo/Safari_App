// file: personal_info_page.dart
import 'package:flutter/material.dart';
import 'package:safari_app/features/auth/screens/createpassword/create_new_password.dart';
import 'package:safari_app/shared/app_button.dart';

class ProfileInformationPage extends StatefulWidget {
  const ProfileInformationPage({super.key});

  @override
  State<ProfileInformationPage> createState() => _ProfileInformationPage();
}

class _ProfileInformationPage extends State<ProfileInformationPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    String? selectedGender;
    String? selectedLocation;
    final List<String> genders = ["Male", "Female", "Other"];
    final List<String> locations = ["Mogadishu", "Nairobi"];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Qoraalka sare
              Text(
                "Profile Information",
                style: TextStyle(
                  fontSize: width * 0.07,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Please Complete the registration from first",
                style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.5),
              ),

              SizedBox(height: height * 0.03),
              // Full Name
              Text(
                "Full Name",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: height * 0.015),
                width: double.infinity,
                height: height * 0.061,
                decoration: BoxDecoration(
                  color: Colors.white, // ka duwan white page background
                  border: Border.all(color: Colors.grey.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(12),
                ),
                // padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: width * 0.025),
                    const Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Enter Fullname",
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
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: height * 0.015),
                width: double.infinity,
                height: height * 0.061,
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    // Country code
                    Container(
                      padding: const EdgeInsets.only(right: 8),
                      child: const Text(
                        "🇸🇴 +252",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    // Divider
                    Container(
                      height: 24,
                      width: 1,
                      color: Colors.grey.withOpacity(0.3),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                    ),
                    // Phone input
                    Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
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

              // Email Address
              Text(
                "Email Address",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: height * 0.015),
                width: double.infinity,
                height: height * 0.061,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(12),
                ),
                // padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: width * 0.025),
                    const Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Enter Email Adress",
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Location
              // Location Dropdown
              Text(
                "Location",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: height * 0.015),
                width: double.infinity,
                height: height * 0.061,
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.withOpacity(0.3)),
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

              Text(
                "Gender",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              // Gender Dropdown
              Container(
                margin: EdgeInsets.symmetric(vertical: height * 0.015),
                width: double.infinity,
                height: height * 0.061,
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedGender,
                    hint: const Text("Select Gender"),
                    isExpanded: true,
                    onChanged: (_) {},
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
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: width * 0.01,
                ), // same as phone input
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
