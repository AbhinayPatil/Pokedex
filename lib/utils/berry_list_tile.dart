import 'package:flutter/material.dart';

class BerryListTile extends StatelessWidget {
  int index;
  String name;
  String imageUrl;
  BerryListTile(
      {super.key,
      required this.imageUrl,
      required this.index,
      required this.name});

  @override
  Widget build(BuildContext context) {
    int r = (index * 10) % 255;
    int g = (index * 15) % 255;
    int b = (index * 20) % 255;
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(200, r, g, b),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            20,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(imageUrl),
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
