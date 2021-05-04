import 'package:flutter/material.dart';
import 'package:vocabulary_box/blocs/lessons_bloc.dart';
import 'package:vocabulary_box/ui/lessons/lessons_ui.dart';
import 'package:vocabulary_box/ui/utils/colors.dart' as colors;
import 'package:vocabulary_box/ui/utils/fonts.dart' as fonts;

class VocabularyBox extends StatefulWidget {
  @override
  _VocabularyBoxState createState() => _VocabularyBoxState();
}

class _VocabularyBoxState extends State<VocabularyBox> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(),
      theme: ThemeData(
        backgroundColor: colors.background,
        accentColor: colors.accent,
        dividerColor: colors.divider,
        buttonColor: colors.button,
        primaryIconTheme: IconThemeData(color: Color(0xff131313), size: 30),
        textTheme: TextTheme(
            subtitle1: fonts.subtitle1,
            bodyText1: fonts.bodyText1,
            bodyText2: fonts.bodyText2),
      ),
      home: FutureBuilder(
        builder: (context, snapshot) {
          print(snapshot.hasData);
          if (snapshot.hasData)
            return LessonsUI();
          else
            return Container(
              color: Theme.of(context).backgroundColor,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
        },
        future: lessonBloc.fetch(),
      ),
    );
  }
}
