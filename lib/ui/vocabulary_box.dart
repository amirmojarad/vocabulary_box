import 'package:flutter/material.dart';
import 'package:vocabulary_box/blocs/lessons_bloc.dart';
import 'package:vocabulary_box/ui/lessons/lessons_ui.dart';
import 'package:vocabulary_box/ui/utils/colors.dart' as colors;
import 'package:vocabulary_box/ui/utils/fonts.dart' as fonts;
import 'package:vocabulary_box/ui/utils/dark_theme_fonts.dart' as darkFonts;
import 'package:vocabulary_box/ui/utils/dark_theme_colors.dart' as darkColors;

class VocabularyBox extends StatefulWidget {
  @override
  _VocabularyBoxState createState() => _VocabularyBoxState();
}

class _VocabularyBoxState extends State<VocabularyBox> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        cardColor: darkColors.wordCard,
        backgroundColor: darkColors.background,
        accentColor: darkColors.accent,
        dividerColor: darkColors.divider,
        buttonColor: darkColors.button,
        primaryIconTheme: IconThemeData(color: darkColors.button),
        textTheme: TextTheme(
          headline6: darkFonts.headline6,
          subtitle1: darkFonts.subtitle1,
          bodyText1: darkFonts.bodyText1,
          bodyText2: darkFonts.bodyText2,
          headline1: darkFonts.headline1,
          subtitle2: darkFonts.subtitle2,
          caption: darkFonts.caption,
        ),
      ),
      theme: ThemeData(
        cardColor: colors.wordCard,
        backgroundColor: colors.background,
        accentColor: colors.accent,
        dividerColor: colors.divider,
        buttonColor: colors.button,
        primaryIconTheme: IconThemeData(color: colors.button),
        textTheme: TextTheme(
          caption: fonts.caption,
          headline6: fonts.headline6,
          subtitle1: fonts.subtitle1,
          bodyText1: fonts.bodyText1,
          bodyText2: fonts.bodyText2,
          headline1: fonts.headline1,
          subtitle2: fonts.subtitle2,
        ),
      ),
      // theme: ThemeData(
      //   cardColor: darkColors.wordCard,
      //   backgroundColor: darkColors.background,
      //   accentColor: darkColors.accent,
      //   dividerColor: darkColors.divider,
      //   buttonColor: darkColors.button,
      //   primaryIconTheme: IconThemeData(color: darkColors.button),
      //   textTheme: TextTheme(
      //     headline6: darkFonts.headline6,
      //     subtitle1: darkFonts.subtitle1,
      //     bodyText1: darkFonts.bodyText1,
      //     bodyText2: darkFonts.bodyText2,
      //     headline1: darkFonts.headline1,
      //     subtitle2: darkFonts.subtitle2,
      //   ),
      // ),
      home: FutureBuilder(
        builder: (context, snapshot) {
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
