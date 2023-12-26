import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';

class ItemCard extends StatefulWidget {
  final dynamic itemData;
  final Function onChange;
  const ItemCard({super.key, required this.itemData, required this.onChange});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    final price = widget.itemData["price"];
    final name = widget.itemData["name"];
    final weight = widget.itemData["weight"] < 1
        ? "${(widget.itemData["weight"] * 1000).toInt()} gm"
        : "${widget.itemData["weight"]} Kg";
    final imageUrl = widget.itemData["image"];

    void addItem() {
      setState(() {
        count++;
      });
      widget.onChange(price.toDouble());
    }

    void subtractItem() {
      if (count > 0) {
        setState(() {
          count--;
        });

        widget.onChange(-(price.toDouble()));
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(38),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.05),
              offset: Offset(0, 20),
              blurRadius: 35,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageUrl,
                height: 106,
                width: 106,
                fit: BoxFit.fill,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: Container(
                        height: 106,
                        width: 106,
                        color: const Color.fromRGBO(238, 241, 244, 1),
                        child: Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                                color: Colors.grey,
                          ),
                        ),
                      ),
                    );
                  }
                },
                errorBuilder: (context, error, stackTrace) {
                  print(error);
                  return const EmptyImage();
                },
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 95,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$name",
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.mulish(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(32, 26, 27, 1)),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "\$$price",
                    style: GoogleFonts.mulish(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(161, 166, 160, 1),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Weight: $weight",
                    style: GoogleFonts.mulish(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromRGBO(32, 26, 27, 1)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const CircleAvatar(
                    radius: 15,
                    backgroundColor: Color.fromRGBO(238, 241, 244, 1),
                    child: LikeButton(
                      size: 18,
                      circleSize: 12,
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            Row(
              children: [
                ChangeIcon(
                  isAdd: false,
                  onPressed: subtractItem,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "$count",
                    style: GoogleFonts.roboto(
                        fontSize: 20,
                        color: const Color.fromRGBO(195, 198, 201, 1),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                ChangeIcon(
                  isAdd: true,
                  onPressed: addItem,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class EmptyImage extends StatelessWidget {
  const EmptyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 106,
      width: 106,
      color: const Color.fromRGBO(238, 241, 244, 1),
      child: Center(
        child: SvgPicture.asset(
          "assets/pic_icon.svg",
          colorFilter: const ColorFilter.mode(
              Color.fromRGBO(179, 183, 190, 1), BlendMode.srcIn),
        ),
      ),
    );
  }
}

class ChangeIcon extends StatelessWidget {
  final bool isAdd;
  final void Function() onPressed;

  const ChangeIcon({super.key, required this.isAdd, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(238, 241, 244, 1),
            borderRadius: BorderRadius.circular(8)),
        child: isAdd
            ? const Icon(
                Icons.add,
                color: Color.fromRGBO(57, 63, 72, 1),
              )
            : const Icon(Icons.remove, color: Color.fromRGBO(57, 63, 72, 1)),
      ),
    );
  }
}
