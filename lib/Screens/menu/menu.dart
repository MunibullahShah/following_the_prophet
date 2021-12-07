import 'package:flutter/material.dart';
import 'package:following_the_prophet/Screens/GalleryPage.dart';
import 'package:following_the_prophet/Screens/Login/login_screen.dart';
import 'package:following_the_prophet/Screens/RateUsPage.dart';
import 'package:following_the_prophet/Screens/SendDataFile.dart';
import 'package:following_the_prophet/Screens/contactUsPage.dart';
import 'package:following_the_prophet/Screens/favorite/favorite_page.dart';
import 'package:following_the_prophet/Screens/lastRead/lastRead.dart';
import 'package:following_the_prophet/Screens/visitOurWebsitePage.dart';

class NavigationMenu extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 25);

  @override
  Widget build(BuildContext context) {
    //final String name = 'Following The Prophet';
    return Drawer(
      child: Material(
        color: Color(0xFF645647),
        child: ListView(
          children: [
            const SizedBox(
              height: 48,
            ),
            buildMenuItem(
                text: 'Last Read',
                icon: Icons.book,
                onClicked: () => selectPage(context, 0)),
            const SizedBox(
              height: 5,
            ),
            buildMenuItem(
                text: 'Favorite',
                icon: Icons.favorite,
                onClicked: () => selectPage(context, 1)),
            const SizedBox(
              height: 5,
            ),
            buildMenuItem(
                text: 'Visit Our Website',
                icon: Icons.language,
                onClicked: () => selectPage(context, 2)),
            const SizedBox(
              height: 5,
            ),
            buildMenuItem(
                text: 'Contact Us',
                icon: Icons.contact_mail,
                onClicked: () => selectPage(context, 3)),
            const SizedBox(
              height: 5,
            ),
            buildMenuItem(
                text: 'Gallery',
                icon: Icons.collections,
                onClicked: () => selectPage(context, 4)),
            const SizedBox(
              height: 5,
            ),
            buildMenuItem(
                text: 'Rate us',
                icon: Icons.rate_review,
                onClicked: () => selectPage(context, 5)),
            const SizedBox(
              height: 5,
            ),
            buildMenuItem(
              text: 'SignIn/Logout',
              icon: Icons.account_circle,
              onClicked: () => selectPage(context, 6),
            ),
            const SizedBox(
              height: 5,
            ),
            buildMenuItem(
                text: 'Send data file',
                icon: Icons.upload_file,
                onClicked: () => selectPage(context, 7)),
            const SizedBox(
              height: 25,
            ),
            Divider(color: Colors.white70)
          ], //childreen
        ),
      ),
    );
  }
}

Widget buildMenuItem({
  final String text,
  final IconData icon,
  VoidCallback onClicked,
}) {
  final color = Colors.white;
  final hoverColor = Colors.white60;
  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ),
    title: Text(
      text,
      style: TextStyle(color: color),
    ),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}

void selectPage(BuildContext context, int index) {
  Navigator.of(context).pop(); //close the navigation bar
  switch (index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => LastReadPage(),
      ));
      break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => FavoritePage(),
      ));
      break;
    case 2:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => VisitOurWebsitePage(),
      ));
      break;
    case 3:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ContactUsPage(),
      ));
      break;
    case 4:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => GalleryPage(),
      ));
      break;
    case 5:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => RateUsPage(),
      ));
      break;
    case 6:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ));
      break;
    case 7:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SendDataFile(),
      ));
      break;
  }
}

// Widget buildHeader({
//   final String name,
//   final VoidCallback onClicked,
// }) =>
//     InkWell(
//       onTap: onClicked,
//     );
