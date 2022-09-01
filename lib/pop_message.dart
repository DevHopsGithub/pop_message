// Copyright (c) 2022 DevHops. All rights reserved. pop_message.dart
library pop_message;

import 'package:flutter/material.dart';

Future popMessage(BuildContext context, String title, String message) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
}

Future<bool> popMessageConfirm(
    BuildContext context, String title, String message,
    {String yes = "Sim", String no = "Não"}) async {
  return await popMessageConfirmRaw(context, title, message, yes, no) ?? false;
}

Future popMessageConfirmRaw(
    BuildContext context, String title, String message, String yes, String no) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              child: Text(no),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            TextButton(
                child: Text(yes),
                onPressed: () {
                  Navigator.pop(context, true);
                })
          ],
        );
      });
}

Future notifyMessage(BuildContext context, String title, String message) async {
  Widget continueButton = TextButton(
    child: const Text("Ok"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      continueButton,
    ],
  );

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
