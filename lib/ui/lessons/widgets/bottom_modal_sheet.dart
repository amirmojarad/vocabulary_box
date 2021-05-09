import 'package:flutter/material.dart';
import 'package:vocabulary_box/blocs/controllers/bottom_modal_sheet_controller.dart';
import 'package:vocabulary_box/ui/utils/device.dart';
import 'package:vocabulary_box/ui/utils/colors.dart' as colors;

void buildBottomModalSheet(BuildContext context, Function setState) {
  BottomSheetController controller = BottomSheetController();
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Add New Lesson",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28.0, vertical: 8),
                child: SizedBox(
                  child: Divider(),
                  width: device.width,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Container(
                  child: TextFormField(
                    onFieldSubmitted: (value) async =>
                        await controller.addNewLesson(context),
                    controller: controller.controller,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: colors.deActiveBorder),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      border: InputBorder.none,
                      hintText: "Lesson Title",
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: colors.activeBorder),
                          borderRadius: BorderRadius.circular(4)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 8.0,
                ),
                child: GestureDetector(
                  onTap: () async => await controller.addNewLesson(context),
                  child:
                      Text("Add", style: Theme.of(context).textTheme.bodyText1),
                ),
              ),
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18), topRight: Radius.circular(18)),
        ),
        width: device.width,
        height: device.height / 4.5,
      );
    },
  );
}
