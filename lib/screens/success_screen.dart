import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_cart/screens/home_screen.dart';

// StatefulWidget for the SuccessScreen
class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    // Delaying navigation to HomeScreen after 5 seconds
    Future.delayed(
      const Duration(seconds: 5),
      () => Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(), // Navigating to HomeScreen
          ),
          (route) => false),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Displaying a Lottie animation for success
            Lottie.asset("assets/success_icon_lottie.json", repeat: false),
            // Displaying a text indicating successful order placement
            Text(
              "Congratulations 🎉!\n Your order has been placed.",
              textAlign: TextAlign.center,
              style: GoogleFonts.mulish(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
