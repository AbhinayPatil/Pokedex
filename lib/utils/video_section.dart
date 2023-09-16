// import 'package:flutter/material.dart';
// import 'package:link_preview_generator/link_preview_generator.dart';

// class VideoSection extends StatelessWidget {
//   VideoSection({super.key});

//   var urlList = [
//     "https://github.com/AbhinayPatil",
//     "https://www.pokemon.com/us/pokemon-news",
//     "https://www.pokemon.com/us/play-pokemon",
//     "https://www.pokemon.com/us/pokemon-episodes",
//     "https://www.pokemon.com/us/pokemon-video-games",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           "Trending",
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 24,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: LinkPreviewGenerator(
//               bodyMaxLines: 3,
//               link: urlList[3],
//               linkPreviewStyle: LinkPreviewStyle.large,
//               showGraphic: true,
//               showBody: false,
//               bodyTextOverflow: TextOverflow.ellipsis,
//               graphicFit: BoxFit.fill),
//         ),
//       ],
//     );
//   }
// }
