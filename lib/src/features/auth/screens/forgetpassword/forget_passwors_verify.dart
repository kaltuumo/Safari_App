import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safari_app/src/features/auth/screens/resetpassword/reset_password_page.dart';
import 'package:safari_app/src/shared/app_button.dart';

class ForgetPassworsVerify extends StatefulWidget {
  final bool isPhoneSelected; // ✅ value ka imanaya page hore

  const ForgetPassworsVerify({super.key, required this.isPhoneSelected});

  @override
  State<ForgetPassworsVerify> createState() => _ForgetPassworsVerify();
}

class _ForgetPassworsVerify extends State<ForgetPassworsVerify> {
  final int otpLength = 5;
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(otpLength, (_) => TextEditingController());
    focusNodes = List.generate(otpLength, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.06,
            vertical: height * 0.17,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Qoraalka sare
              Text(
                widget.isPhoneSelected
                    ? "Verify your phone number "
                    : "Please check your email",
                style: TextStyle(fontSize: width * 0.09, height: 1.5),
              ),

              SizedBox(height: height * 0.011),
              Text(
                widget.isPhoneSelected
                    ? "We have sent an SMS with an Activation code \nto your phone +252*******52"
                    : "We,re send a code to youremail.gmail.com",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: width * 0.039,

                  height: 1.5,
                ),
              ),
              SizedBox(height: height * 0.04),

              // OTP Fields in one line
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(otpLength, (index) {
                  return SizedBox(
                    width: width * 0.14,
                    height: height * 0.068,
                    child: TextField(
                      controller: controllers[index],
                      focusNode: focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      maxLength: 1,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        counterText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.orange,
                            width: 2,
                          ),
                        ),
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty && index < otpLength - 1) {
                          FocusScope.of(
                            context,
                          ).requestFocus(focusNodes[index + 1]);
                        }
                        if (value.isEmpty && index > 0) {
                          FocusScope.of(
                            context,
                          ).requestFocus(focusNodes[index - 1]);
                        }
                      },
                    ),
                  );
                }),
              ),
              SizedBox(height: height * 0.09),

              // Resend text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "I didn't receive the code  ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Resend",
                      style: TextStyle(
                        color: Color(0xFFC3161C),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),

              // Verify Button
              Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.03),
                width: double.infinity,
                height: height * 0.06,
                child: AppButton(
                  text: "Verify",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ResetPasswordPage(),
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
