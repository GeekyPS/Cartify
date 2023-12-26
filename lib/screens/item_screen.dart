import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_cart/data/data.dart'; // Importing data file
import 'package:shopping_cart/widgets/item_screen/bottom_container.dart'; // Importing a bottom container widget
import 'package:shopping_cart/widgets/item_screen/item_card.dart'; // Importing an item card widget

// StatefulWidget for the ItemScreen
// ignore: must_be_immutable
class ItemScreen extends StatefulWidget {
  double costPurchased; // Tracks the total cost of purchased items
  final bool isFruits; // Indicates whether the screen displays fruits or vegetables

  ItemScreen({Key? key, required this.costPurchased, required this.isFruits})
      : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    // Selecting the appropriate list based on isFruits value
    final listData = widget.isFruits ? fruits : vegetables;

    // Function to update the total cost of purchased items
    void itemChanged(double diff) {
      setState(() {
        widget.costPurchased += diff;
      });
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 248, 248, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        centerTitle: false,
        title: Text(
          widget.isFruits ? "Fruits" : "Vegetables",
          style: GoogleFonts.mulish(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(
              Icons.account_circle_rounded,
              color: Color.fromRGBO(102, 112, 128, 1),
              size: 36,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                  itemBuilder: (context, index) =>
                      ItemCard(itemData: listData[index], onChange: itemChanged),
                  itemCount: listData.length,
                ),
              ),
              BottomContainer(cost: widget.costPurchased, isFruits: widget.isFruits)
              // Widget displaying the bottom container with total cost
            ],
          ),
        ),
      ),
    );
  }
}
