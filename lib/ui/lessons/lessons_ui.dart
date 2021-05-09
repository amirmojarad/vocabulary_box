import 'package:flutter/material.dart';
import 'package:vocabulary_box/blocs/lessons_bloc.dart';
import 'package:vocabulary_box/models/lesson.dart';
import 'package:vocabulary_box/models/lessons.dart';
import 'package:vocabulary_box/models/word.dart';
import 'package:vocabulary_box/ui/lessons/lessons_layout.dart';
import 'package:vocabulary_box/ui/lessons/widgets/floating_button.dart';
import 'package:vocabulary_box/ui/search/search_ui.dart';
import 'package:vocabulary_box/ui/utils/device.dart';

class LessonsUI extends StatefulWidget {
  @override
  _LessonsUIState createState() => _LessonsUIState();
}

class _LessonsUIState extends State<LessonsUI> {
  @override
  Widget build(BuildContext context) {
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
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchUI(),
                      ));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).accentColor.withOpacity(0.4),
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      )),
                  width: 50,
                  height: 75.0,
                  child: Center(
                    child: Icon(Icons.search,
                        color: Theme.of(context).accentColor),
                  ),
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
      body: LessonsLayout(),
    );
  }
}
