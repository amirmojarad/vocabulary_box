import 'package:flutter/material.dart';
import 'package:vocabulary_box/blocs/controllers/lesson_ui_controller.dart';
import 'package:vocabulary_box/models/lesson.dart';
import 'package:vocabulary_box/ui/utils/colors.dart' as colors;
import 'package:vocabulary_box/ui/utils/device.dart';

class LessonLayout extends StatefulWidget {
  Lesson lesson;

  LessonLayout(this.lesson);

  @override
  _LessonLayoutState createState() => _LessonLayoutState();
}

class _LessonLayoutState extends State<LessonLayout> {
  LessonUIController controller = LessonUIController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildNewWordTextField(context,
                          hintText: "New Word",
                          node: controller.wordNode,
                          controller: controller.controller, function: () {
                        controller.next(context);
                      }),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: buildNewWordTextField(context,
                            node: controller.meaningNode,
                            controller: controller.meaningsController,
                            hintText: "Meaning", function: () {
                          controller.addMeanings(context, widget.lesson, () {
                            setState(() {});
                          });
                        }),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => controller.addMeanings(context, widget.lesson, () {
                  setState(() {});
                }),
                child: Text(
                  "Add",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: SizedBox(
                  child: Divider(),
                  width: device.width,
                ),
              ),
              widget.lesson.words.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: controller.makeWords(
                        widget.lesson,
                        context,
                        () {
                          setState(() {});
                        },
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildNewWordTextField(BuildContext context,
      {Function function,
      String hintText,
      TextEditingController controller,
      FocusScopeNode node}) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyText2,
      focusNode: node,
      textInputAction: hintText.toLowerCase().contains("word")
          ? TextInputAction.next
          : TextInputAction.done,
      onFieldSubmitted: (value) async => await function(),
      controller: controller,
      onChanged: (value) {
        setState(() {});
      },
      decoration: InputDecoration(
        suffixIcon: controller.text.isNotEmpty
            ? IconButton(
                onPressed: () {
                  setState(() {
                    controller.clear();
                  });
                },
                icon: Icon(Icons.clear),
              )
            : Icon(Icons.add, color: Theme.of(context).backgroundColor),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.deActiveBorder),
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        border: InputBorder.none,
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.activeBorder),
        ),
        hintText: hintText,
        fillColor: Colors.red,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black54),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
