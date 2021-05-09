import 'package:flutter/material.dart';
import 'package:vocabulary_box/blocs/lessons_bloc.dart';
import 'package:vocabulary_box/models/lesson.dart';
import 'package:vocabulary_box/models/lessons.dart';
import 'package:vocabulary_box/models/word.dart';
import 'package:vocabulary_box/ui/lessons/lessons_layout.dart';
import 'package:vocabulary_box/ui/lessons/widgets/floating_button.dart';
import 'package:vocabulary_box/ui/utils/device.dart';

class LessonsUI extends StatefulWidget {
  @override
  _LessonsUIState createState() => _LessonsUIState();
}

class _LessonsUIState extends State<LessonsUI> {
  bool selected = false;
  TextEditingController controller = TextEditingController();

  Widget wordCardResult(Word word, Lesson lesson) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${word.word} in ${lesson.title}"),
          Text(word.meaningsToString())
        ],
      ),
    );
  }

  Widget lessonCardResult(Lesson lesson) {
    return Container(
      child: Column(
        children: [Text(lesson.title), Text(lesson.words.length.toString())],
      ),
    );
  }

  List<Widget> makeSearchResult(String text) {
    if (text.isEmpty) return [];
    List<Widget> result = [];
    Lessons lessons = lessonBloc.jsonProvider.lessons;
    // Find in lessons
    // adding Lesson title
    if (lessons.contains(text)) {
      result.add(
        Text(
          "Lesssons",
          style: Theme.of(context).textTheme.bodyText2,
        ),
      );
    }
    lessons.lessons.forEach((element) {
      if (element.title.startsWith(text)) result.add(lessonCardResult(element));
    });
    // Find in words
    // adding Words title
    for (var lesson in lessons.lessons) {
      for (var word in lesson.words)
        if (word.word.startsWith(text)) {
          result.add(
            Text(
              "Words",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          );
          break;
        }
    }
    for (var lesson in lessons.lessons) {
      for (var word in lesson.words)
        if (word.word.startsWith(text)) {
          result.add(wordCardResult(word, lesson));
        }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    print(selected);
    device = Device(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildFloatingButton(context, () {
        setState(() {});
      }),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0, top: 5, bottom: 5),
            child: Center(
              child: AnimatedContainer(
                decoration: BoxDecoration(
                    color: Color(0xffC0D0F0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    )),
                width: selected ? 200.0 : 50.0,
                height: 75.0,
                alignment: selected
                    ? Alignment.center
                    : AlignmentDirectional.topCenter,
                duration: const Duration(milliseconds: 900),
                curve: Curves.fastOutSlowIn,
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18),
                          bottomLeft: Radius.circular(18)),
                    ),
                    border: InputBorder.none,
                    // border: OutlineInputBorder(
                    //   borderSide: BorderSide(color: Colors.transparent),
                    //   borderRadius: BorderRadius.only(
                    //       topLeft: Radius.circular(18),
                    //       bottomLeft: Radius.circular(18)),
                    // ),
                    hintText: selected ? "Search..." : "",
                    hintStyle: Theme.of(context).textTheme.subtitle1,
                    suffixIcon: Icon(
                      Icons.search,
                      size: 28,
                    ),
                    contentPadding:
                        EdgeInsets.only(left: 18, top: 16, bottom: 16),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                  onTap: () {
                    selected = !selected;
                    if (!selected) {
                      FocusScope.of(context).nextFocus();
                    }
                    setState(() {});
                  },
                  autofocus: false,
                ),
              ),
            ),
          )
        ],
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          "Vocabulary Box",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: Stack(
        children: [
          LessonsLayout(),
          selected
              ? AnimatedOpacity(
                  opacity: selected ? 0.95 : 0.0,
                  duration: Duration(milliseconds: 900),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                    child: Container(
                        child: SingleChildScrollView(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: makeSearchResult(controller.text),
                        )),
                        decoration: BoxDecoration(
                            color: Color(0xffC0D0F0),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50))),
                        width: device.width,
                        height: device.height / 2),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
