import 'package:flutter/material.dart';

class AlartDilog {
  static void showloading(
      {required BuildContext context, required String massege}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(massege),
                )
              ],
            ),
          );
        });
  }

  static void hidelogin(BuildContext context) {
    Navigator.pop(context);
  }

  static void massege(
      {required BuildContext context,
      required String massge, required String title,
      String? nameactions,
      Function? action}) {
    List<Widget> actions = [];
    if (nameactions != null) {
      actions.add(TextButton(
          onPressed: () {
            Navigator.pop(context);
            action?.call();
          },
          child: Text(nameactions)));
    }
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(massge),
            actions: actions,
            title: Text(title),
          );
        });
  }
}
