import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practice/login_page.dart';
import 'package:practice/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            "GizmoMart"
                .text
                .xl5
                .bold
                .color(
                  Theme.of(context).textTheme.displayLarge?.color ??
                      mytheme.blueishcolor,
                )
                .make(),
            InkWell(
              onTap: () {
                // Alert dialog show karna hai jab user profile icon pe tap kare
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: Row(
                        children: [
                          Icon(Icons.account_circle, size: 28),
                          SizedBox(width: 10),
                          Text("User Options"),
                        ],
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.login, color: Colors.green),
                            title: Text("Login"),
                            onTap: () {
                              // Login functionality

                              Navigator.of(context).pop();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  )); // Close dialog
                              // Navigate to login screen or add login functionality
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.logout, color: Colors.red),
                            title: Text("Logout"),
                            onTap: () {
                              // Logout functionality
                              FirebaseAuth.instance.signOut();
                              Navigator.of(context).pop();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LoginPage())); // Close dialog
                              // Add logout functionality
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: Icon(
                Icons.account_circle,
                size: 40,
              ),
            ),
          ],
        ),
        "Trending Products"
            .text
            .color(Theme.of(context).textTheme.displayLarge?.color ??
                mytheme.blueishcolor)
            .xl2
            .make()
      ],
    );
  }
}
