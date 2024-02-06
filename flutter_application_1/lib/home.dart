import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Bottom Navigation Bar',
      home: HomePage(),
    ),
  );
}



class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 26, 26, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          'assets/logo2.png',
          height: 40,
          width: 40,
          fit: BoxFit.contain,
        ),
        shape: AppBarShape(
          color: Color.fromRGBO(0, 255, 163, 1),
          borderWidth: 1,
          borderHeight: 1,
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeDetailPage(),
          LessonsDetailPage(),
          TaskDetailPage(),
          AccountDetailPage(),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(displayWidth * 0.05),
        height: displayWidth * 0.2,
        decoration: BoxDecoration(
          color: Color.fromRGBO(21, 20, 21, 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomBarButton(
              icon: Icons.home_rounded,
              label: 'Home',
              index: 0,
              currentIndex: currentIndex,
              onTap: (index) {
                handleNavigation(index);
                // Add your specific action for Home button here
              },
            ),
            BottomBarButton(
              icon: Icons.menu_book_rounded,
              label: 'Lessons',
              index: 1,
              currentIndex: currentIndex,
              onTap: (index) {
                handleNavigation(index);
                // Add your specific action for Lessons button here
              },
            ),
            BottomBarButton(
              icon: Icons.assignment_rounded,
              label: 'Task',
              index: 2,
              currentIndex: currentIndex,
              onTap: (index) {
                handleNavigation(index);
                // Add your specific action for Task button here
              },
            ),
            BottomBarButton(
              icon: Icons.person_rounded,
              label: 'Account',
              index: 3,
              currentIndex: currentIndex,
              onTap: (index) {
                handleNavigation(index);
                // Add your specific action for Account button here
              },
            ),
          ],
        ),
      ),
    );
  }

  void handleNavigation(int index) {
    setState(() {
      currentIndex = index;
      HapticFeedback.lightImpact();
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }
}

class BottomBarButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final int index;
  final int currentIndex;
  final Function onTap;

  const BottomBarButton({
    required this.icon,
    required this.label,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () => onTap(index),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.fastLinearToSlowEaseIn,
            width: index == currentIndex
                ? displayWidth * 0.32
                : displayWidth * 0.18,
            alignment: Alignment.center,
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              curve: Curves.fastLinearToSlowEaseIn,
              height: index == currentIndex ? displayWidth * 0.12 : 0,
              width: index == currentIndex ? displayWidth * 0.32 : 0,
              decoration: BoxDecoration(
                color: index == currentIndex
                    ? Color.fromRGBO(0, 255, 163, 1)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.fastLinearToSlowEaseIn,
            width: index == currentIndex
                ? displayWidth * 0.31
                : displayWidth * 0.18,
            alignment: Alignment.center,
            child: Stack(
              children: [
                Row(
                  children: [
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      width: index == currentIndex
                          ? displayWidth * 0.13
                          : 0,
                    ),
                    AnimatedOpacity(
                      opacity: index == currentIndex ? 1 : 0,
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      child: Text(
                        index == currentIndex ? '$label' : '',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: displayWidth * 0.04,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      width: index == currentIndex
                          ? displayWidth * 0.03
                          : 20,
                    ),
                    Icon(
                      icon,
                      size: displayWidth * 0.076,
                      color: index == currentIndex
                          ? Colors.black
                          : Colors.black26,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarShape extends ShapeBorder {
  final double borderWidth;
  final double borderHeight;
  final Color color;

  const AppBarShape({
    required this.borderWidth,
    required this.borderHeight,
    required this.color,
  });

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(0);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..addRRect(RRect.fromRectAndRadius(rect, Radius.circular(0)))
      ..moveTo(rect.left, rect.bottom)
      ..lineTo(rect.left, rect.bottom)
      ..lineTo(rect.right, rect.bottom)
      ..lineTo(rect.right, rect.bottom)
      ..lineTo(rect.left, rect.bottom);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    canvas.drawPath(getOuterPath(rect), paint);
  }

  @override
  ShapeBorder scale(double t) {
    return AppBarShape(
      borderWidth: borderWidth * t,
      borderHeight: borderHeight * t,
      color: color,
    );
  }
}

class HomeDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 26, 26, 1),
      body: Center(
        child: Text('This is the Home Detail Page'),
      ),
    );
  }
}

class LessonsDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 26, 26, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PressableRoundedCorner(label: 'Lesson 1: Basic Alphabetics and Numbers Sign'),
            SizedBox(height: 40),
            PressableRoundedCorner(label: 'Corner 2'),
            SizedBox(height: 40),
            PressableRoundedCorner(label: 'Corner 3'),
            SizedBox(height: 40),
            PressableRoundedCorner(label: 'Corner 4'),
            SizedBox(height: 40),
            PressableRoundedCorner(label: 'Corner 5'),
          ],
        ),
      ),
    );
  }
}

class TaskDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 26, 26, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PressableRoundedCorner(label: 'Corner 1'),
            SizedBox(height: 40),
            PressableRoundedCorner(label: 'Corner 2'),
            SizedBox(height: 40),
            PressableRoundedCorner(label: 'Corner 3'),
            SizedBox(height: 40),
            PressableRoundedCorner(label: 'Corner 4'),
            SizedBox(height: 40),
            PressableRoundedCorner(label: 'Corner 5'),
          ],
        ),
      ),
    );
  }
}

class AccountDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(26, 26, 26, 1),
      body: Center(
        child: Text('This is the Account Detail Page'),
      ),
    );
  }
}

class PressableRoundedCorner extends StatelessWidget {
  final String label;

  const PressableRoundedCorner({required this.label});

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        // Add your specific action for the pressable corner here
        print('$label pressed!');
      },
      child: Container(
        width: displayWidth * 0.8,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 255, 163, 1), // Customize the corner's color
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: displayWidth * 0.05,
          ),
        ),
      ),
    );
  }
}
