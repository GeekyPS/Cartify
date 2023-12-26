import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_cart/screens/item_screen.dart';

class CustomStartButton extends StatelessWidget {
  const CustomStartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>  ItemScreen(costPurchased: 0.00,isFruits: true,),
        ));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 98),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(102, 112, 128, 1),
            borderRadius: BorderRadius.circular(50),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.1),
                offset: Offset(0, 40),
                blurRadius: 40,
                spreadRadius: 0,
              ),
            ]),
        child: Text(
          'START',
          style: GoogleFonts.roboto(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }
}
