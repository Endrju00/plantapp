import 'package:flutter/material.dart';
import 'package:plantapp/Screens/AddPlant/add_plant.dart';
import 'package:plantapp/constants.dart';

class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(0.5),
                offset: Offset.zero),
          ],
        ),
        height: size.height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavbarButton(
              icon: Icons.favorite,
              press: () {},
            ),
            NavbarButton(
              icon: Icons.add_box,
              press: () {
                Navigator.push(
                  context,
                  goToAddPlant(),
                );
              },
            ),
            NavbarButton(
              icon: Icons.person,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class NavbarButton extends StatelessWidget {
  const NavbarButton({
    Key? key,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final IconData icon;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 70,
      width: size.width / 3,
      child: ClipRect(
        child: Material(
          child: IconButton(
            icon: Icon(
              icon,
              color: cPrimaryColor,
            ),
            onPressed: press,
          ),
        ),
      ),
    );
  }
}

Route goToAddPlant() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const AddPlant(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
