import 'package:flutter/material.dart';
import 'package:vocabulary_box/ui/lessons/widgets/bottom_modal_sheet.dart';

FloatingActionButton buildFloatingButton(BuildContext context, Function setState) {
  return FloatingActionButton(
    onPressed: () {
      buildBottomModalSheet(context, setState);
    },
    child: Icon(Icons.add, color: Theme.of(context).primaryIconTheme.color),
  );
}
