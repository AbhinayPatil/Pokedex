import 'package:flutter/material.dart';
import 'package:pokedex/models/move_detail_model.dart';
import 'package:pokedex/utils/move_detail_widget.dart';

import '../services/move_detail_api.dart';

class MoveListTile extends StatelessWidget {
  int index;
  String name;
  String detailUrl;
  MoveListTile(
      {required this.index, required this.name, required this.detailUrl});

  void displayDetail(BuildContext context) async {
    //fetch detail of particular move
    MoveDetailApi method = MoveDetailApi();
    MoveDetailModel move = await method.apiCall(index);

    //build box for that particular move
    showDialog(
      context: context,
      builder: (context) => MoveDetailWidget(move: move),
    );
  }

  @override
  Widget build(BuildContext context) {
    int r = (index * 10) % 255;
    int g = (index * 15) % 255;
    int b = (index * 20) % 255;
    return InkWell(
      onTap: () => displayDetail(context),
      child: Container(
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
      ),
    );
  }
}
