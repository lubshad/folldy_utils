import 'package:basic_template/basic_template.dart';
import 'package:flutter/material.dart';
import 'package:folldy_utils/presentation/elements/element_utils.dart';

class LandscapePage extends StatelessWidget {
  const LandscapePage({
    Key? key,
    required this.item,
    required this.onTap,
    required this.onScreenTap,
  }) : super(key: key);

  final Map<String, dynamic> item;
  final Function(Map<String, dynamic>) onTap;
  final VoidCallback onScreenTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: item["backgroundImage"] == null
            ? null
            : DecorationImage(
                image: CachedNetworkImageProvider(item["backgroundImage"],
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
          fit: StackFit.expand,
          // clipBehavior: Clip.none,
          children: [
            FractionallySizedBox(
              widthFactor: 1,
              heightFactor: 1,
              child: GestureDetector(
                onTap: onScreenTap,
              ),
            ),
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
                      child: PresentationItem(item: e, onTap: onTap),
                    )))
                .toList()
          ],
        );
      }),
    );
  }
}

class LandscapeThumbnail extends StatelessWidget {
  const LandscapeThumbnail({Key? key, required this.item}) : super(key: key);

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: item["backgroundImage"] == null
            ? null
            : DecorationImage(
                image: CachedNetworkImageProvider(item["backgroundImage"],
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
          children: items
              .map((e) => Positioned(
                    top: e["top"],
                    left: e["left"],
                    height: e["height"],
                    width: e["width"],
                    // child: GestureDetector(
                    //   onTap: e["hidden"] != true && e["topic"] == true
                    //       ? () => onTap(e)
                    //       : null,
                    child: ThumbnailItem(item: e),
                  ))
              .toList(),
        );
      }),
    );
  }
}
