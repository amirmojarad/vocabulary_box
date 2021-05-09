import 'package:flutter/material.dart';
import 'package:vocabulary_box/ui/lessons/widgets/bottom_modal_sheet.dart';
import 'package:vocabulary_box/ui/utils/device.dart';

Widget buildFloatingButton(
    //buildBottomModalSheet(context, setState);
    BuildContext context,
    Function setState) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12.0),
    child: Container(
      decoration: BoxDecoration(
          color: Color(0xff30A3F0), borderRadius: BorderRadius.circular(12)),
      width: device.width / 2.5,
      height: 50,
      child: Center(
          child: Text("Add New Lesson",
              style: Theme.of(context).textTheme.bodyText1)),
    ),
  );
}
