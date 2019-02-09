import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const kToolbarHeight = 120.0;

class _ToolbarContainerLayout extends SingleChildLayoutDelegate {
  const _ToolbarContainerLayout();

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return constraints.tighten(height: kToolbarHeight);
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(constraints.maxWidth, kToolbarHeight);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return Offset(0.0, size.height - childSize.height);
  }

  @override
  bool shouldRelayout(_ToolbarContainerLayout oldDelegate) => false;
}

var waveHeight = kToolbarHeight / 2;
var shadowSize = 20;

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height);

    var firstControlPoint = new Offset(size.width * 0.2, size.height);
    var firstEndPoint = new Offset(size.width * 0.49, size.height - shadowSize);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(
        size.width - (size.width * 0.2), size.height - waveHeight + shadowSize);
    var secondEndPoint =
        Offset(size.width, size.height - waveHeight + shadowSize);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - waveHeight);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class PokedexAppBar extends StatelessWidget implements PreferredSizeWidget {
  static const double height = 2560.0;

  @override
  Size get preferredSize => Size.fromHeight(2000.00);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    SystemChrome.setEnabledSystemUIOverlays([]);

    final Brightness brightness = themeData.primaryColorBrightness;
    final SystemUiOverlayStyle overlayStyle = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;

    IconThemeData appBarIconTheme = themeData.primaryIconTheme;
    TextStyle sideStyle = themeData.primaryTextTheme.body1;
    Color shadow = Color(0x77000000);

    Widget curve = ClipPath(
      child: Container(
        width: waveHeight,
        height: waveHeight,
        decoration: new BoxDecoration(
          color: shadow,
        ),
        child: Align(
          alignment: Alignment(0, -1),
          child: ClipPath(
            child: Container(
              width: waveHeight,
              height: waveHeight - shadowSize,
              decoration: new BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            clipper: BottomWaveClipper(),
          ),
        ),
      ),
      clipper: BottomWaveClipper(),
    );

    Widget createBall(Color color) {
      var gradient = RadialGradient(
        center: const Alignment(0.7, -0.6), // near the top right
        radius: 0.2,
        colors: [
          const Color(0x77FFFF00), // yellow sun
          color, // blue sky
        ],
        stops: [1, 1],
      );

      return Container(
        margin: EdgeInsets.all(10.0),
        child: Material(
          elevation: 3.0,
          color: color,
          shape: CircleBorder(),
          child: Container(
            width: 20.0,
            height: 20.0,
            decoration: new BoxDecoration(
              gradient: gradient,
              shape: BoxShape.circle,
            ),
          ),
        ),
      );
    }

    Widget blueBall = Container(
      child: new Container(
        child: Align(
          alignment: Alignment(-4, -1),
          child: Container(
            width: 40.0,
            height: 40.0,
            margin: EdgeInsets.all(15.0),
            decoration: new BoxDecoration(
              color: const Color(0xFF00E9DC), // border color
              shape: BoxShape.circle,
            ),
            child: Align(
              alignment: Alignment(-0.5, -1),
              child: Container(
                width: 20.0,
                height: 20.0,
                margin: EdgeInsets.all(5.0),
                decoration: new BoxDecoration(
                  color: const Color(0xEEFFFFFF), // border color
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
        decoration: new BoxDecoration(
          color: const Color(0xFF00A9DC), // border color
          shape: BoxShape.circle,
        ),
      ),
      width: 80.0,
      height: 80.0,
      padding: const EdgeInsets.all(4.0), // borde width
      decoration: new BoxDecoration(
        color: const Color(0xFFFFFFFF), // border color
        shape: BoxShape.circle,
      ),
    );

    Widget bottomShadow = new Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: 40.0,
              width: 0.0,
            ),
            Container(
              decoration: new BoxDecoration(
                color: shadow,
              ),
              height: 20.0,
              width: 40.0,
            ),
          ],
        ),
        curve,
        new Expanded(
          child: Align(
            alignment: Alignment(-4, -4),
            child: new Container(
              height: 20.0,
              decoration: new BoxDecoration(
                color: shadow,
              ),
            ),
          ),
        ),
      ],
    );

    // If the toolbar is allocated less than kToolbarHeight make it
    // appear to scroll upwards within its shrinking container.
    Widget appBar = ClipRect(
      child: CustomSingleChildLayout(
        delegate: const _ToolbarContainerLayout(),
        child: IconTheme.merge(
          data: appBarIconTheme,
          child: DefaultTextStyle(
            style: sideStyle,
            child: Row(
              children: [
                new Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: blueBall,
                        ),
                      ),
                      Container(
                        color: shadow,
                        height: 20.0,
                        width: 100.0,
                      ),
                    ]),
                new Expanded(
                  child: new Column(
                    children: <Widget>[
                      new Expanded(
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 20.0,
                              ),
                              createBall(Colors.red),
                              createBall(Colors.yellow),
                              createBall(Colors.green),
                            ],
                          ),
                        ),
                      ),
                      bottomShadow
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    return Material(
      color: themeData.primaryColor,
      //color: Colors.transparent,
      child: appBar,
    );
  }
}
