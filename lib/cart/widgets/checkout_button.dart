import 'package:flutter/material.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    Key? key,
    required this.totalSelectedItem,
    required this.totalSelectedPrice,
  }) : super(key: key);

  final int totalSelectedItem;
  final int totalSelectedPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_checkout, size: 32),
            label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    totalSelectedItem < 1 ? "Checkout" : "Checkout ($totalSelectedItem)",
                    style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  totalSelectedItem < 1
                      ? const SizedBox()
                      : Text(
                          "Total Rp$totalSelectedPrice",
                          style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w300),
                        ),
                ],
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              minimumSize: const Size(270, 85),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              padding: const EdgeInsets.fromLTRB(20, 15, 10, 15),
            ),
          ),
        )
      ],
    );
  }
}
