import 'package:basic_template/basic_template.dart';
import 'package:flutter/material.dart';
import 'package:folldy_utils/presentation/elements/element_utils.dart';

import '../../utils/constants.dart';

class PngTextElement extends StatelessWidget {
  const PngTextElement({Key? key, required this.item})
      : super(key: key);
  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return item["gallery_image"] == true
          ? GalleryImageElement(item: item,)
          : Visibility(
              visible: item["hidden"] != true,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (item["png"] != null)
                    CachedNetworkImage(
                      imageUrl:  item["png"],
                      fit: BoxFit.values[item["fit"]],
                      cacheManager: Get.find<CacheManager>(),
                    ),
                  if (item["child"] != null)
                    Positioned(
                        top: item["child"]["top"],
                        left: item["child"]["left"],
                        height: item["child"]["height"],
                        width: item["child"]["width"],
                        child: PresentationItem(
                          item: item["child"],
                        )),
                ],
              ),
            );
    });
  }
}

class GalleryImageElement extends StatelessWidget {
  final Map<String, dynamic> item;

  const GalleryImageElement(
      {Key? key, required this.item, required })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        closedColor: Colors.transparent,
        closedElevation: 0,
        closedBuilder: (context, action) => CachedNetworkImage(
              imageUrl:  item["png"],
              fit: BoxFit.values[item["fit"]],
              cacheManager: Get.find<CacheManager>(),
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
                      imageUrl:   item["png"],
                      fit: BoxFit.values[item["fit"]],
                      cacheManager: Get.find<CacheManager>(),
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

class PngTextElementThumbnail extends StatelessWidget {
  const PngTextElementThumbnail(
      {Key? key, required this.item})
      : super(key: key);
  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Stack(
        fit: StackFit.expand,
        children: [
          if (item["png"] != null)
            CachedNetworkImage(
              imageUrl:item["png"],
              fit: BoxFit.values[item["fit"]],
              cacheManager: Get.find<CacheManager>(),
            ),
          if (item["child"] != null)
            Positioned(
                top: item["child"]["top"],
                left: item["child"]["left"],
                height: item["child"]["height"],
                width: item["child"]["width"],
                child: PresentationItem(
                  item: item["child"],
                )),
        ],
      );
    });
  }
}
