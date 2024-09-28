import 'package:flutter/material.dart';

// Show error message to the user with a modern look
void displayErrorMassage(String massage, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Colors.white,
      title: Row(
        children: const [
          Icon(
            Icons.error_outline,
            color: Colors.redAccent,
          ),
          SizedBox(width: 10),
          Text(
            'Error',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
      content: Text(
        massage,  // Keeping the massage variable for the error message
        style: TextStyle(
          fontSize: 16,
          color: Colors.black54,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20),
            backgroundColor: Colors.redAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'OK',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );
}

