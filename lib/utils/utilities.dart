
import 'package:flutter/material.dart';
import 'network_dialog.dart';

class Utilities{
  BuildContext? _dialogContext;
  void showNetworkStatusDialog(BuildContext context, bool isConnected) {
    if (_dialogContext != null) {
      Navigator.of(_dialogContext!).pop();
    }
    showDialog(
      context: context,
      builder: (context) {
        _dialogContext = context; // Store the context of the current dialog
        return NetworkDialog(isConnected: isConnected);
      },
    ).then((_) {
      _dialogContext = null; // Clear the dialog context after it is closed
    });
  }
}