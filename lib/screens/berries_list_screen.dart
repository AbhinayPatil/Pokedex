import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:pokedex/models/berries_list_model.dart';
import 'package:pokedex/models/berry_details.dart';
import 'package:pokedex/services/berry_detail_api.dart';
import 'package:pokedex/services/berry_list_api.dart';
import 'package:pokedex/utils/berry_list_tile.dart';

import '';

class BerriesListScreen extends StatefulWidget {
  const BerriesListScreen({super.key});

  @override
  State<BerriesListScreen> createState() => _BerriesListScreenState();
}

class _BerriesListScreenState extends State<BerriesListScreen> {
  List<BerriesListModel> berries = [];
  void _fetchData() async {
    BerryListApi method = BerryListApi();
    berries = await method.apiCall();
    setState(() {});
  }

  Future<BerryDetails> _fetchBerryDetails(int index) async {
    BerryDetailApi method = BerryDetailApi();
    return await method.apiCall(index);
  }

  @override
  void initState() {
    // TODO: implement initState
    _fetchData();
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
          "Berries",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
      body: (berries.isEmpty)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * .9,
                  child: GridView.builder(
                    itemCount: 64,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).size.width ~/ 120,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 2,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: ()  {
                          setState(() {
                            
                          });
                          // int r = (index * 10) % 255;
                          // int g = (index * 15) % 255;
                          // int b = (index * 20) % 255;
                          // BerryDetails berryDetails =
                          //     await _fetchBerryDetails(index + 1);
                          // showDialog(
                          //   context: context,
                          //   builder: (context) {
                          //     return AlertDialog(
                          //       backgroundColor: Color.fromARGB(255, r, g, b),
                          //       elevation: 5,
                          //       shape: const RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.all(
                          //           Radius.circular(
                          //             20,
                          //           ),
                          //         ),
                          //       ),
                          //       actions: [
                          //         Wrap(
                          //           children: [
                          //             Row(
                          //               mainAxisAlignment:
                          //                   MainAxisAlignment.center,
                          //               children: [
                          //                 Image.network(
                          //                     berries[index].imageUrl),
                          //                 const SizedBox(
                          //                   width: 5,
                          //                 ),
                          //                 Text(
                          //                   berries[index].name,
                          //                   style: const TextStyle(
                          //                     color: Colors.white,
                          //                     fontSize: 24,
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //             const Divider(
                          //               color: Colors.white60,
                          //               thickness: 3,
                          //               indent: 20,
                          //               endIndent: 20,
                          //             ),
                          //             Row(
                          //               children: [
                          //                 for (int i = 0;
                          //                     i < berryDetails.flavors.length;
                          //                     i++) ...[
                          //                   Chip(
                          //                     backgroundColor:
                          //                         Colors.transparent,
                          //                     side: const BorderSide(
                          //                       color: Colors.white,
                          //                       width: 2,
                          //                     ),
                          //                     label: Text(
                          //                       berryDetails.flavors[i],
                          //                     ),
                          //                   )
                          //                 ],
                          //               ],
                          //             ),
                          //           ],
                          //         ),
                          //       ],
                          //     );
                          //   },
                          // );
                        
                        },
                        child: BerryListTile(
                          imageUrl: berries[index].imageUrl,
                          index: index,
                          name: berries[index].name,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
    );
  }
}
