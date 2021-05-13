import 'package:flutter/material.dart';
import 'package:vocabulary_box/ui/lessons/widgets/bottom_modal_sheet.dart';

Widget buildFloatingButton(BuildContext context, Function setState) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12.0),
    child: GestureDetector(
      onTap: () {
        buildBottomModalSheet(context, setState);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.circular(12),
        ),
        height: 50,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "Add New Lesson",
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      ),
    ),
  );
}
