import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_cart/widgets/home_screen/custom_start_button.dart';

// Creating a HomeScreen widget which is a StatelessWidget
class HomeScreen extends StatelessWidget {
  // Constructor for HomeScreen widget
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Scaffold widget provides a framework for the home screen
    return Scaffold(
      // Setting background color for the screen
      backgroundColor: const Color.fromRGBO(238, 241, 244, 1),
      body: SafeArea(
        // Ensures content is displayed within safe areas of devices
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Displaying an image of a cart using Image.asset
            Image.asset(
              "assets/cart.png",
              height: 320,
              width: 320,
            ),
            // Displaying a text widget for the app title
            Text(
              "Cartify, shopping made effortless.",
              textAlign: TextAlign.center,
              style: GoogleFonts.mulish(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            // Displaying a text widget for a description
            Text(
              "Personalized carts for your unique needs.",
              style:
                  GoogleFonts.mulish(fontSize: 16, fontWeight: FontWeight.w300),
            ),
            const SizedBox(height: 60,), // Adding space between widgets
            const CustomStartButton(), // Custom widget for starting the app
            const SizedBox(
              height: 120,
            ) // Adding space at the bottom of the screen
          ],
        ),
      ),
    );
  }
}
