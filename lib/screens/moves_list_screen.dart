import 'package:flutter/material.dart';
import 'package:pokedex/models/moves_list_model.dart';
import 'package:pokedex/services/moves_list_api.dart';
import 'package:pokedex/utils/moves_list_tile.dart';

class MovesListScreen extends StatefulWidget {
  const MovesListScreen({super.key});

  @override
  State<MovesListScreen> createState() => _MovesListScreenState();
}

class _MovesListScreenState extends State<MovesListScreen> {
  List<MovesListModel> moves = [];

  //call to api function
  Future<void> _fetchMoves() async {
    MovesListApi method = MovesListApi();
    moves = await method.apiCall();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    _fetchMoves();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Moves",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * .9,
        child: (moves.isEmpty)
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(18.0),
                child: GridView.builder(
                  itemCount: 918,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width ~/ 120,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3,
                  ),
                  itemBuilder: (context, index) {
                    return MoveListTile(
                      index: index + 1,
                      name: moves[index].name,
                      detailUrl: moves[index].detailUrl,
                    );
                  },
                ),
              ),
      ),
    );
  }
}
