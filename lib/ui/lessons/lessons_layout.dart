import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:vocabulary_box/blocs/lessons_bloc.dart';
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
        children: lessonBloc.jsonProvider.lessons.lessons.length != 0
            ? List.generate(
                lessonBloc.jsonProvider.lessons.lessons.length,
                (index) {
                  return makeLessonCard(
                    context,
                    lessonBloc.jsonProvider.lessons.lessons[index],
                  );
                },
              )
            : [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "List is Empty",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
              ],
      ),
    );
  }

  List<PopupMenuItem> generateItems(Lesson lesson) {
    List<PopupMenuItem> result = [];
    result.add(PopupMenuItem(
      value: "Edit",
      child: Text("Edit"),
    ));
    result.add(PopupMenuItem(
      value: "Delete",
      child: GestureDetector(
        child: Text("Delete"),
      ),
    ));
    return result;
  }

  Widget makeLessonCard(BuildContext context, Lesson lesson) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LessonUI(lesson),
          ),
        );
      },
      child: Container(
        width: device.width,
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            ListTile(
              title: Text(
                lesson.title,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              subtitle: Text(
                '${lesson.words.length} words',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              trailing: PopupMenuButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                onSelected: (value) async {
                  switch (value) {
                    case "Delete":
                      lessonBloc.jsonProvider.remove(lesson);
                      await lessonBloc.save();
                      setState(() {});
                      SnackBar snackBar = SnackBar(
                        backgroundColor: Theme.of(context).accentColor,
                        content: Container(
                          height: device.height / 16,
                          child: Row(
                            children: [
                              Text("ASDASD"),
                              //TODO add undo delete
                              Spacer(),
                              IconButton(
                                icon:
                                    Icon(Icons.undo_sharp, color: Colors.white),
                                onPressed: () async {
                                  lessonBloc.jsonProvider.addLesson(lesson);
                                  await lessonBloc.save();
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      break;
                    case "Edit":
                      TextEditingController editController =
                          TextEditingController();
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        context: context,
                        builder: (context) {
                          return Container(
                            width: device.width,
                            height: device.height / 6,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: device.width / 10,
                                  child: Divider(
                                    thickness: 1,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 0,
                                      horizontal: 16,
                                    ),
                                    child: TextFormField(
                                      controller: editController,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            borderSide: BorderSide(
                                                color: Theme.of(context)
                                                    .accentColor),
                                          ),
                                          hintText: "${lesson.title}"),
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                  flex: 3,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: GestureDetector(
                                      onTap: () async {
                                        lessonBloc.jsonProvider
                                            .edit(lesson, editController.text);
                                        await lessonBloc.save();
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Edit",
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ).then((value) {
                        setState(() {});
                      });
                      break;
                  }
                },
                color: Theme.of(context).backgroundColor,
                child: Icon(Icons.more_horiz_outlined),
                itemBuilder: (context) => generateItems(lesson),
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
    );
  }
}
