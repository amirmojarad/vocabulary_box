import 'package:flutter/material.dart';
import 'package:vocabulary_box/ui/lessons/widgets/bottom_modal_sheet.dart';

FloatingActionButton buildFloatingButton(BuildContext context) {
  return FloatingActionButton(
    onPressed: () {
      buildBottomModalSheet(context);
    },
    child: Icon(Icons.add, color: Theme.of(context).primaryIconTheme.color),
  );
}
