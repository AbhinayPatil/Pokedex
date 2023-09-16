import 'package:flutter/material.dart';

class MoveListTile extends StatelessWidget {
  int index;
  String name;
  String detailUrl;
  MoveListTile(
      {required this.index, required this.name, required this.detailUrl});

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
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
