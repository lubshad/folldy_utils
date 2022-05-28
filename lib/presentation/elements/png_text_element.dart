import 'package:basic_template/basic_template.dart';
import 'package:flutter/material.dart';
import 'package:folldy_utils/presentation/elements/element_utils.dart';

import '../../utils/constants.dart';

class PngTextElement extends StatelessWidget {
  const PngTextElement({Key? key, required this.item, required this.baseUrl})
      : super(key: key);
  final Map<String, dynamic> item;
  final String baseUrl;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return item["gallery_image"] == true
          ? GalleryImageElement(item: item, baseUrl: baseUrl)
          : Visibility(
              visible: item["hidden"] != true,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (item["png"] != null)
                    CachedNetworkImage(
                      imageUrl: baseUrl + item["png"],
                      fit: BoxFit.values[item["fit"]],
                    ),
                  if (item["child"] != null)
                    Positioned(
                        top: item["child"]["top"],
                        left: item["child"]["left"],
                        height: item["child"]["height"],
                        width: item["child"]["width"],
                        child: getPresentationItem(item["child"])),
                ],
              ),
            );
    });
  }
}

class GalleryImageElement extends StatelessWidget {
  final Map<String, dynamic> item;
  final String baseUrl;

  const GalleryImageElement(
      {Key? key, required this.item, required this.baseUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        closedBuilder: (context, action) => CachedNetworkImage(
              imageUrl: baseUrl + item["png"],
              fit: BoxFit.values[item["fit"]],
            ),
        openBuilder: ((context, action) => Builder(builder: (context) {
              Size size = MediaQuery.of(context).size;

              return Container(
                alignment: Alignment.center,
                width: size.width,
                height: size.height,
                color: Colors.black,
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: baseUrl + item["png"],
                      fit: BoxFit.values[item["fit"]],
                    ),
                    Positioned(
                        top: defaultPadding,
                        right: defaultPadding,
                        child: IconButton(
                            onPressed: Get.back, icon: const Icon(Icons.close)))
                  ],
                ),
              );
            })));
  }
}
