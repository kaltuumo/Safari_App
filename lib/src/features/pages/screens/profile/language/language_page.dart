import 'package:flutter/material.dart';
import 'package:safari_app/src/shared/app_button.dart';
import 'package:safari_app/src/utils/constant/colors.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  // List of languages and countries
  final List<Map<String, String>> languages = [
    {'country': 'United States', 'language': 'English'},
    {'country': 'Spain', 'language': 'Español'},
    {'country': 'France', 'language': 'Français'},
    {'country': 'Italy', 'language': 'Italiano'},
    {'country': 'Portugal', 'language': 'Português'},
    {'country': 'China', 'language': '中文 (Zhōngwén)'},
    {'country': 'Japan', 'language': '日本語 (Nihongo)'},
    {'country': 'Russia', 'language': 'Русский (Russkiy)'},
    {'country': 'Germany', 'language': 'Deutsch'},
    {'country': 'Saudi Arabia', 'language': 'العربية (Arabic)'},
  ];

  String? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: width * 0.1,
          ),
          child: Column(
            children: [
              // Header
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
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
                  SizedBox(width: width * 0.25),
                  Text(
                    "Language",
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(height: height * 0.04),
              // Use Expanded for scrollable list
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    // ===== Suggested Languages =====
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x12000000),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header gudaha container-ka
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            child: Text(
                              "Suggested Languages",
                              style: TextStyle(
                                fontSize: width * 0.045,
                                fontWeight: FontWeight.w600,
                                color: AppColors.grey,
                              ),
                            ),
                          ),
                          // Liiska luqadaha la soo jeediyay
                          ...languages
                              .where(
                                (lang) =>
                                    lang['language'] == 'English' ||
                                    lang['language'] == 'Español',
                              )
                              .map((lang) {
                                final langName = lang['language']!;
                                final countryName = lang['country']!;
                                return Column(
                                  children: [
                                    ListTile(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 0,
                                          ),
                                      title: Text(
                                        "$countryName - $langName",
                                        style: TextStyle(
                                          fontSize: width * 0.045,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      trailing: Radio<String>(
                                        value: langName,
                                        groupValue: selectedLanguage,
                                        activeColor: AppColors.primaryColor,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedLanguage = value;
                                          });
                                        },
                                      ),
                                      onTap: () {
                                        setState(() {
                                          selectedLanguage = langName;
                                        });
                                      },
                                    ),
                                    const Divider(
                                      height: 1,
                                      color: Colors.grey,
                                    ),
                                  ],
                                );
                              })
                              .toList(),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ===== Other Languages =====
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x12000000),
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header gudaha container-ka
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            child: Text(
                              "Other Languages",
                              style: TextStyle(
                                fontSize: width * 0.045,
                                fontWeight: FontWeight.w600,
                                color: AppColors.grey,
                              ),
                            ),
                          ),
                          // Liiska luqadaha kale
                          ...languages
                              .where(
                                (lang) =>
                                    lang['language'] != 'English' &&
                                    lang['language'] != 'Español',
                              )
                              .map((lang) {
                                final langName = lang['language']!;
                                final countryName = lang['country']!;
                                return Column(
                                  children: [
                                    ListTile(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 0,
                                          ),
                                      title: Text(
                                        "$countryName - $langName",
                                        style: TextStyle(
                                          fontSize: width * 0.045,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      trailing: Radio<String>(
                                        value: langName,
                                        groupValue: selectedLanguage,
                                        activeColor: AppColors.primaryColor,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedLanguage = value;
                                          });
                                        },
                                      ),
                                      onTap: () {
                                        setState(() {
                                          selectedLanguage = langName;
                                        });
                                      },
                                    ),
                                    const Divider(
                                      height: 1,
                                      color: Colors.grey,
                                    ),
                                  ],
                                );
                              })
                              .toList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Save button
              AppButton(
                text: "Save",
                onPressed: () {
                  if (selectedLanguage != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Language selected: $selectedLanguage"),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
