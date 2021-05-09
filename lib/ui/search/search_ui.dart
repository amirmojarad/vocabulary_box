import 'package:flutter/material.dart';
import 'package:vocabulary_box/blocs/lessons_bloc.dart';
import 'package:vocabulary_box/models/lesson.dart';
import 'package:vocabulary_box/models/lessons.dart';
import 'package:vocabulary_box/models/word.dart';
import 'package:vocabulary_box/ui/utils/colors.dart' as colors;
import 'package:vocabulary_box/ui/utils/device.dart';

class SearchUI extends StatefulWidget {
  @override
  _SearchUIState createState() => _SearchUIState();
}

class _SearchUIState extends State<SearchUI> {
  TextEditingController controller = TextEditingController();

  Widget wordCardResult(Word word, Lesson lesson) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "${word.word}",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(width: 11),
              Text(" in ${lesson.title}",
                  style: Theme.of(context).textTheme.headline6)
            ],
          ),
          Text(
            word.meaningsToString(),
            style: Theme.of(context).textTheme.subtitle1,
          )
        ],
      ),
    );
  }

  Widget lessonCardResult(Lesson lesson) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lesson.title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            lesson.words.length.toString(),
            style: Theme.of(context).textTheme.subtitle1,
          )
        ],
      ),
    );
  }

  List<Widget> makeSearchResult() {
    var text = controller.text;
    if (text.isEmpty) return [];
    List<Widget> result = [];
    Lessons lessons = lessonBloc.jsonProvider.lessons;
    // Find in lessons
    // adding Lesson title
    if (lessons.contains(text)) {
      result.add(
        Text(
          "Lesssons",
          style: Theme.of(context).textTheme.bodyText1,
        ),
      );
      result.add(
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: SizedBox(
            child: Divider(),
            width: device.width,
          ),
        ),
      );
    }

    lessons.lessons.forEach((element) {
      if (element.title.startsWith(text))
        result.add(Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: lessonCardResult(element),
        ));
    });
    result.add(SizedBox(height: 35));
    // Find in words
    // adding Words title
    for (var lesson in lessons.lessons) {
      for (var word in lesson.words)
        if (word.word.startsWith(text)) {
          result.add(
            Text(
              "Words",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          );
          result.add(
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: SizedBox(
                child: Divider(),
                width: device.width,
              ),
            ),
          );
          break;
        }
    }
    for (var lesson in lessons.lessons) {
      for (var word in lesson.words)
        if (word.word.startsWith(text)) {
          result.add(Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: wordCardResult(word, lesson),
          ));
        }
    }
    if (result.isEmpty) {
      result.add(Text(
        "Nothing to Show",
        style: Theme.of(context).textTheme.bodyText1,
      ));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child:
              Icon(Icons.arrow_back_ios, color: Theme.of(context).accentColor),
        ),
      ),
      body: SafeArea(
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: TextFormField(
                  onFieldSubmitted: (asd) {
                    makeSearchResult();
                    setState(() {});
                  },
                  controller: controller,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colors.activeBorder,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: colors.deActiveBorder,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    border: InputBorder.none,
                    hintText: "Search",
                    hintStyle: Theme.of(context).textTheme.subtitle1,
                    suffixIcon: controller.text.isNotEmpty
                        ? GestureDetector(
                            onTap: () {
                              controller.clear();
                              setState(() {});
                            },
                            child: Icon(
                              Icons.clear,
                              size: 28,
                              color: Theme.of(context).accentColor,
                            ),
                          )
                        : null,
                    contentPadding:
                        EdgeInsets.only(left: 18, top: 16, bottom: 16),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                  autofocus: false,
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: makeSearchResult(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
