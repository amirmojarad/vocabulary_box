import 'package:flutter/material.dart';
import 'package:vocabulary_box/ui/lessons/lessons_layout.dart';
import 'package:vocabulary_box/ui/lessons/widgets/floating_button.dart';
import 'package:vocabulary_box/ui/search/search_ui.dart';
import 'package:vocabulary_box/ui/utils/device.dart';

class LessonsUI extends StatefulWidget {
  @override
  _LessonsUIState createState() => _LessonsUIState();
}

class _LessonsUIState extends State<LessonsUI> {
  bool clearAll = false;

  @override
  Widget build(BuildContext context) {
    device = Device(context);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildFloatingButton(context, () {
        setState(() {});
      }),
      drawer: Container(
        width: device.width / 1.5,
        height: device.height,
        color: Theme.of(context).backgroundColor,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: ClipRRect(
                  child: Image.asset('assets/icon/8.1.png'),
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                child: SizedBox(width: device.width, child: Divider()),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text(
                      "Clear All Lessons",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Switch(
                        value: clearAll,
                        onChanged: (bool value) {
                          setState(() {
                            clearAll = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Text("Created by amirmojarad",
                  style: Theme.of(context).textTheme.headline6)
            ],
          ),
        ),
      ),
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
