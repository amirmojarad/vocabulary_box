import 'package:flutter/material.dart';
import 'package:vocabulary_box/blocs/controllers/lesson_ui_controller.dart';
import 'package:vocabulary_box/blocs/lessons_bloc.dart';
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
          IconButton(
            icon: Icon(Icons.cleaning_services_rounded,
                color: Theme.of(context).accentColor),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => new AlertDialog(
                  backgroundColor: Theme.of(context).backgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  title: Text(
                    "All words will be deleted, do you want to continue?",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  content: Container(
                    height: device.height - 700,
                    width: device.width - 400,
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            width: device.width,
                            child: Divider(),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'PoppinsMedium',
                                    color: Theme.of(context).accentColor,
                                    fontSize: 18,
                                  ),
                                ),
                                onTap: () async {
                                  setState(() {
                                    widget.lesson.words.clear();
                                  });
                                  await controller.save();
                                  Navigator.pop(context);
                                },
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'PoppinsMedium',
                                      color: Colors.redAccent,
                                      fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).accentColor,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: Theme.of(context).backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                content: Builder(
                  builder: (_) => FutureBuilder(
                    future: lessonBloc.save(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        Navigator.pop(context);
                      }
                      return Container(
                          height: device.height - 700,
                          width: device.width - 400,
                          child: Center(child: CircularProgressIndicator()));
                    },
                  ),
                ),
              ),
            ).then((value) => Navigator.pop(context));
          },
        ),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: LessonLayout(widget.lesson),
    );
  }
}
