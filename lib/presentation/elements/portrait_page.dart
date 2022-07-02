import 'package:basic_template/basic_template.dart';
import 'package:flutter/material.dart';
import 'package:folldy_utils/presentation/elements/element_utils.dart';

import 'package:palette_generator/palette_generator.dart';

// Calculate dominant color from ImageProvider
Future<Color?> getImagePalette(ImageProvider imageProvider) async {
  final PaletteGenerator paletteGenerator =
      await PaletteGenerator.fromImageProvider(imageProvider);
  return paletteGenerator.dominantColor?.color;
}

class PortraitPage extends StatelessWidget {
  const PortraitPage({
    Key? key,
    required this.item,
    required this.onTap,
    required this.domainUrl,
    required this.previousPage,
    required this.nextPage,
  }) : super(key: key);
  final Map<String, dynamic> item;
  final Function(Map<String, dynamic> item) onTap;
  final String domainUrl;
  final VoidCallback previousPage;
  final VoidCallback nextPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: item["backgroundImage"] == null
            ? null
            : DecorationImage(
                image: CachedNetworkImageProvider(
                    domainUrl + item["backgroundImage"],
                    cacheManager: Get.find<CacheManager>()),
                fit: BoxFit.values[item["fit"]]),
        color: Color(item["color"]),
        // border: Border.all(color: Colors.black87)
      ),
      height: item["height"],
      width: item["width"],
      child: Builder(builder: (context) {
        List<dynamic> items = item["items"];
        return Stack(
            // clipBehavior: Clip.none,
            children: [
              // FractionallySizedBox(
              //   widthFactor: 1,
              //   heightFactor: 1,
              //   alignment: Alignment.topLeft,
              //   child: Row(
              //     children: [
              //       Expanded(
              //           child: GestureDetector(
              //               onTap: previousPage,
              //               child: Container(
              //                 color: Colors.transparent,
              //                 width: double.infinity,
              //               ))),
              //       Expanded(
              //           child: GestureDetector(
              //               onTap: nextPage,
              //               child: Container(
              //                 color: Colors.transparent,
              //                 width: double.infinity,
              //               ))),
              //     ],
              //   ),
              // ),
              ...items
                  .map((e) => Positioned(
                      top: e["top"],
                      left: e["left"],
                      height: e["height"],
                      width: e["width"],
                      child: GestureDetector(
                        onTap: e["hidden"] != true && e["topic"] == true
                            ? () => onTap(e)
                            : null,
                        child: PresentationItem(item: e, domainUrl: domainUrl),
                      )))
                  .toList(),
            ]);
      }),
    );
  }
}

class PortraitThumbnail extends StatelessWidget {
  const PortraitThumbnail({
    Key? key,
    required this.item,
    required this.domainUrl,
  }) : super(key: key);
  final Map<String, dynamic> item;
  final String domainUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: item["backgroundImage"] == null
            ? null
            : DecorationImage(
                image: CachedNetworkImageProvider(
                    domainUrl + item["backgroundImage"],
                    cacheManager: Get.find<CacheManager>()),
                fit: BoxFit.values[item["fit"]]),
        color: Color(item["color"]),
        // border: Border.all(color: Colors.black87)
      ),
      height: item["height"],
      width: item["width"],
      child: Builder(builder: (context) {
        List<dynamic> items = item["items"];
        return Stack(
            // clipBehavior: Clip.none,
            children: [
              // FractionallySizedBox(
              //   widthFactor: 1,
              //   heightFactor: 1,
              //   alignment: Alignment.topLeft,
              //   child: Row(
              //     children: [
              //       Expanded(
              //           child: GestureDetector(
              //               onTap: previousPage,
              //               child: Container(
              //                 color: Colors.transparent,
              //                 width: double.infinity,
              //               ))),
              //       Expanded(
              //           child: GestureDetector(
              //               onTap: nextPage,
              //               child: Container(
              //                 color: Colors.transparent,
              //                 width: double.infinity,
              //               ))),
              //     ],
              //   ),
              // ),
              ...items
                  .map((e) => Positioned(
                        top: e["top"],
                        left: e["left"],
                        height: e["height"],
                        width: e["width"],
                        // child: GestureDetector(
                        //   onTap: e["hidden"] != true && e["topic"] == true
                        //       ? () => onTap(e)
                        //       : null,
                        child: ThumbnailItem(item: e, domainUrl: domainUrl),
                      ))
                  // )
                  .toList(),
            ]);
      }),
    );
  }
}
