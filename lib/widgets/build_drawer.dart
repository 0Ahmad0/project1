import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p_1/constants/const.dart';

Divider buildDivider() {
  return Divider(
    color: Colors.black,
  );
}
class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width-40 , 0);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height/2);
    path.quadraticBezierTo(
        size.width, size.height - (size.height / 4), size.width-40, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }

}

class BuildLeftDrawer extends StatelessWidget {
  final Widget child;

  const BuildLeftDrawer({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: AlignmentDirectional.bottomCenter,
                  colors: [
                    K1Color1A73CA,
                    Colors.white,
                  ]
              ),
              boxShadow: [BoxShadow(color: Colors.black45)]),
          width: MediaQuery.of(context).size.width / 1.5,
          child: SafeArea(
            child: child,
          ),
        ),
      ),
    );
  }
}
