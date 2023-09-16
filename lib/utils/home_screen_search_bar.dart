import 'package:flutter/material.dart';

class HomeScreenSearchBar extends StatefulWidget {
  TextEditingController controller;
  HomeScreenSearchBar({super.key,required this.controller});

  @override
  State<HomeScreenSearchBar> createState() => _HomeScreenSearchBarState();
}

class _HomeScreenSearchBarState extends State<HomeScreenSearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: const TextStyle(
        color: Colors.white70,
      ),
      cursorColor: Colors.blueGrey,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.white60,
        ),
        hintText: "Search Pokémon",
        hintStyle: const TextStyle(
          color: Colors.white38,
        ),
        fillColor: Colors.white.withOpacity(.2),
        filled: true,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              50,
            ),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              50,
            ),
          ),
        ),
      ),
    );
  }
}
