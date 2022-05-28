import 'package:basic_template/basic_template.dart';
import 'package:flutter/material.dart';
import 'package:folldy_utils/presentation/elements/element_utils.dart';

class PortraitPage extends StatelessWidget {
  const PortraitPage({
    Key? key,
    required this.item,
    required this.handleOnTap,
    required this.baseUrl,
  }) : super(key: key);
  final Map<String, dynamic> item;
  final Function(dynamic) handleOnTap;
  final String baseUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: item["backgroundImage"] == null
            ? null
            : DecorationImage(
                image: CachedNetworkImageProvider(baseUrl + item["backgroundImage"]),
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
              //               onTap: Get.find<PresentationViewController>()
              //                   .previousPage,
              //               child: Container(
              //                 color: Colors.transparent,
              //                 width: double.infinity,
              //               ))),
              //       Expanded(
              //           child: GestureDetector(
              //               onTap:
              //                   Get.find<PresentationViewController>().nextPage,
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
                            ? () => handleOnTap(e)
                            : null,
                        child: getPresentationItem(e, baseUrl: baseUrl),
                      )))
                  .toList(),
            ]);
      }),
    );
  }
}
