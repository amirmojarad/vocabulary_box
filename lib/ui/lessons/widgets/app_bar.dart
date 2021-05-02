import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Theme.of(context).backgroundColor,
    title: Text(
      "Vocabulary Box",
      style: Theme.of(context).textTheme.bodyText1,
    ),
  );
}
