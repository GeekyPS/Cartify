import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_cart/screens/item_screen.dart';
import 'package:shopping_cart/screens/success_screen.dart';

class BottomContainer extends StatelessWidget {
  final double cost;
  final bool isFruits;
  const BottomContainer(
      {super.key, required this.cost, required this.isFruits});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.only(top: 40, left: 20, right: 24),
      decoration: const BoxDecoration(
        color: Color.fromRGBO(102, 112, 128, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total",
                style: GoogleFonts.mulish(
                    fontSize: 14,
                    color: const Color.fromRGBO(238, 241, 244, 1),
                    fontWeight: FontWeight.w300),
              ),
              Text(
                "\$${cost.toStringAsFixed(2)}",
                style: GoogleFonts.mulish(
                    fontSize: 20,
                    color: const Color.fromRGBO(238, 241, 244, 1),
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => isFruits
                    ? ItemScreen(costPurchased: cost, isFruits: false)
                    : const SuccessScreen(),
              ));
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 70),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(57, 63, 72, 1),
                borderRadius: BorderRadius.circular(50),
              ),
              child: isFruits
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'NEXT',
                          style: GoogleFonts.roboto(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                          size: 18,
                        )
                      ],
                    )
                  : Text(
                      'CHECK-OUT',
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
