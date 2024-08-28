import 'package:flutter/material.dart';
import 'package:practice/utills/routes.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("H.Md Asfee Ansari",style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.w600),),
                accountEmail: Text("asfee@gmail.com",style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.w600),),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://static.vecteezy.com/system/resources/thumbnails/027/951/137/small_2x/stylish-spectacles-guy-3d-avatar-character-illustrations-png.png",
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.white),
              title: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.HomeRoute);
                },
                child: Text("Home",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.white),
              title: Text("Profile",
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            ListTile(
              leading: Icon(Icons.email, color: Colors.white),
              title: Text("Email Me",
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.LoginRoute);
              },
              child: ListTile(
                leading: Icon(Icons.login, color: Colors.white),
                title: Text("Login",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
