import 'package:cropssafe/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showAlert(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 3,
      backgroundColor: kDarkGreenColor,
      textColor: Colors.white,
      fontSize: 14.0);
}

void showLogoutDialog(BuildContext context, VoidCallback onConfirm) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text("Confirm Logout"),
      content: const Text("Are you sure you want to log out?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(), // Dismiss dialog
          child: Text(
            "Cancel",
            style: TextStyle(color: kDarkGreenColor),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkGreenColor,
          ),
          onPressed: () {
            Navigator.of(ctx).pop(); // Close dialog first
            onConfirm(); // Then perform logout
          },
          child: const Text(
            "Logout",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
