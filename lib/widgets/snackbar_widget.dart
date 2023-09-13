import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class SnackbarWidget {
  static void showMessage(
      BuildContext context, String messageHead, String message, ContentType type) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: messageHead,
        message: message,
        contentType: type,
      ),
    ));
  }
}
