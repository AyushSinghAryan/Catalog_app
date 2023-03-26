import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter/src/cupertino/icons.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://media.licdn.com/dms/image/C4E03AQEWybwFQTxL2Q/profile-displayphoto-shrink_800_800/0/1656564068865?e=2147483647&v=beta&t=-Pqi4Rz_9Ra5EU3fecjvb5A2K64Tr3mZ3V3ZFY8tNmY";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.all(0),
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.all(0),
                  accountName: Text(
                    "Ayush Singh Aryan",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.white, letterSpacing: .5, fontSize: 15),
                    ),
                  ),
                  accountEmail: Text(
                    "ayushsingharyan0@gmail.com",
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.white, letterSpacing: .5, fontSize: 1),
                    ),
                  ),
                  currentAccountPicture:
                      CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
                )),
            ListTile(
              leading: const Icon(
                CupertinoIcons.home,
                color: Colors.white,
                size: 25,
              ),
              title: Text(
                "Home",
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      color: Colors.white, letterSpacing: .5, fontSize: 15),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
                size: 25,
              ),
              title: Text(
                "Profile",
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      color: Colors.white, letterSpacing: .5, fontSize: 15),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                CupertinoIcons.mail,
                color: Colors.white,
                size: 25,
              ),
              title: Text(
                "Mail me",
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      color: Colors.white, letterSpacing: .5, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
