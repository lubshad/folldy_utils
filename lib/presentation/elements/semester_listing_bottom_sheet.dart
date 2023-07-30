import 'package:basic_template/basic_template.dart';
import 'package:flutter/material.dart';
import 'package:folldy_utils/presentation/components/color_container.dart';

import '../../utils/constants.dart';

class SemesterListingBottomSheet extends StatelessWidget {
  const SemesterListingBottomSheet({
    Key? key,
    required this.semesters,
    required this.onTap,
    required this.currentIndex,
  }) : super(key: key);

  final List semesters;

  final int currentIndex;

  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(defaultPadding),
          topRight: Radius.circular(defaultPadding)),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              const ListTile(
                dense: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ColorContainer(
                        child: SizedBox(
                      width: 100,
                    )),
                  ],
                ),
                // trailing:
              ),
              ListTile(
                dense: true,
                trailing: IconButton(
                    onPressed: Get.back, icon: const Icon(Icons.close)),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: defaultPadding,
                right: defaultPadding,
                bottom: defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select Semester",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                GridView(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3,
                      crossAxisSpacing: defaultPadding,
                      mainAxisSpacing: defaultPadding),
                  children: semesters
                      .map((e) => Builder(builder: (context) {
                            bool selected =
                                semesters.indexOf(e) == currentIndex;
                            int semester =
                                int.parse(e.entries.first.key.toString());
                            return InkWell(
                              onTap: () => onTap(semester),
                              child: ColorContainer(
                                  color: selected ? Colors.black : altoGrey,
                                  child: Align(
                                      child: Text(
                                    "Semester $semester",
                                    style: TextStyle(
                                        color: selected
                                            ? Colors.white
                                            : Colors.black),
                                  ))),
                            );
                          }))
                      .toList(),
                )
              ],
            ),
          )

          // Expanded(
          //   child: CupertinoPicker(
          //     scrollController: FixedExtentScrollController(
          //         initialItem: currentIndex),
          //     useMagnifier: true,
          //     itemExtent: defaultPaddingLarge,
          //     magnification: 1.2,
          //     onSelectedItemChanged: onSemsterChanged,
          //     children: semesters
          //         .map((e) => Text("Semester ${e.entries.first.key}"))
          //         .toList(),
          //   ),
          // ),
          // Row(
          //   children: [
          //     Expanded(
          //         child: ElevatedButton(
          //             onPressed: onTap, child: const Text("Done"))),
          //   ],
          // )
        ],
      ),
    );
  }
}
