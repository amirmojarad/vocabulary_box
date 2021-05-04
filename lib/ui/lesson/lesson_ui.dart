import 'package:flutter/material.dart';
import 'package:vocabulary_box/blocs/controllers/lesson_ui_controller.dart';
import 'package:vocabulary_box/models/lesson.dart';
import 'package:vocabulary_box/ui/lesson/lesson_layout.dart';
import 'package:vocabulary_box/ui/utils/device.dart';

class LessonUI extends StatefulWidget {
  Lesson lesson;

  LessonUI(this.lesson);

  @override
  _LessonUIState createState() => _LessonUIState();
}

class _LessonUIState extends State<LessonUI> {
  var value = 0;
  LessonUIController controller = LessonUIController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.lesson.title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        actions: [
          // IconButton(
          //   icon: Icon(Icons.sort),
          //   onPressed: () {
          //     showMenu(
          //       context: context,
          //       position: RelativeRect.fromLTRB(device.width - 60, 35, 50, 10),
          //       items: <PopupMenuEntry>[
          //         PopupMenuItem(
          //
          //           child: Text(
          //             "Sort By",
          //             style: Theme.of(context).textTheme.bodyText1,
          //           ),
          //         ),
          //         PopupMenuItem(
          //           child: Text(
          //             "Alphabet",
          //             style: Theme.of(context).textTheme.bodyText2,
          //           ),
          //           value: 1,
          //           enabled: true,
          //         ),
          //         // PopupMenuItem(
          //         //   child: Text("Alphabet"),
          //         // )
          //       ],
          //     ).whenComplete(() {
          //       print(value);
          //     });
          //   },
          // )
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).buttonColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: LessonLayout(widget.lesson),
    );
  }
}
