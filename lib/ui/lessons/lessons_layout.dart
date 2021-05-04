import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:vocabulary_box/models/lesson.dart';
import 'package:vocabulary_box/ui/lesson/lesson_ui.dart';
import 'package:vocabulary_box/ui/utils/device.dart';
import 'package:vocabulary_box/ui/utils/colors.dart' as colors;

class LessonsLayout extends StatefulWidget {
  @override
  _LessonsLayoutState createState() => _LessonsLayoutState();
}

class _LessonsLayoutState extends State<LessonsLayout> {
  Lesson lesson = Lesson.withAttributes("Lesson 1", 1, []);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LessonUI(lesson),
                    ));
              },
              child: Container(
                color: Theme.of(context).backgroundColor,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Lesson 01',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      subtitle: Text(
                        '0 words',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: device.width / 10, vertical: 0),
                      child: SizedBox(
                        child: Divider(),
                        width: device.width,
                      ),
                    )
                  ],
                ),
              ),
            ),
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: 'Delete',
                color: colors.delete,
                icon: Icons.delete,
                // onTap: () => _showSnackBar('Delete'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
