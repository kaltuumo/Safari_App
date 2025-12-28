import 'package:flutter/material.dart';
import 'package:safari_app/features/auth/screens/splash/splash_screen.dart';
import 'package:safari_app/utils/constant/images.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SplashScreen()),
          );
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color(0xFFC3161C),
          child: Stack(
            children: [
              // Logo-ga bartamaha
              Center(
                child: Image.asset(
                  AppImages.whitelogo,
                  width: 150,
                  height: 150,
                ),
              ),
              // Qoraalka hooska
              const Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Text(
                  "Made with ❤️ by Duuliye.con",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
