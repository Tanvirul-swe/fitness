import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:vector_math/vector_math_64.dart' as math;

class ActivityTracker extends StatefulWidget {
  final double goalCompleted = 0.7;
  static String id = 'ActivityTracker';
  @override
  _ActivityTrackerState createState() => _ActivityTrackerState();
}

class _ActivityTrackerState extends State<ActivityTracker>
    with SingleTickerProviderStateMixin {
  AnimationController _radialProgressAnimationController;
  Animation _progressAnimation;
  double progressDegree = 0;
  @override
  void initState() {
    super.initState();
    _radialProgressAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _progressAnimation = Tween(begin: 0, end: 360.0).animate(CurvedAnimation(
        parent: _radialProgressAnimationController,
        curve: Curves.easeInOutSine))
      ..addListener(() {
        setState(() {
          progressDegree = widget.goalCompleted * _progressAnimation.value;
        });
      });
    _radialProgressAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        backgroundColor: Color(0xFF1D343C),
        title: Text('Today',),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white70,
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Text('Today',style: TextStyle(
                        fontSize: 16.0,
                      ),),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        height: 180,
                        width: 180,
                        child: CustomPaint(
                          child: Container(
                            height: 180,
                            width: 180,
                            padding: EdgeInsets.symmetric(vertical: 40.0),
                            child: AnimatedOpacity(
                              opacity: progressDegree > 30 ? 1.0 : 0.0,
                              duration: Duration(milliseconds: 500),
                              child: Column(
                                children: [
                                  Text('1698',style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                  SizedBox(
                                    height: 4.0,
                                  ),
                                  Text('of 2052 kcal',
                                  style: TextStyle(
                                    color: Color(0xFF757682),
                                    fontSize: 16.0,
                                  ),),
                                ],
                              ),
                            ),
                          ),
                          painter: RadialPainter(progressDegree),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  color: Colors.white70,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  color: Colors.purpleAccent,
                                  height: 10.0,
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'Protein',
                                  style: TextStyle(
                                    color: Color(0xFF757682),
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  color: Color(0xFF59CD90),
                                  height: 10.0,
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'Carbs',
                                  style: TextStyle(
                                    color: Color(0xFF757682),
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  color: Color(0xFFEA526F),
                                  height: 10.0,
                                  width: 10.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'Fats',
                                  style: TextStyle(
                                    color: Color(0xFF757682),
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '256 of 380',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              '90 of 209',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              '86 of 102',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RadialPainter extends CustomPainter {
  double progressInDegrees;
  RadialPainter(this.progressInDegrees);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black12
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15.0;

    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.width / 2, paint);

    Paint progressPaint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15.0
      ..shader = LinearGradient(colors: [
        Colors.red,
        Colors.purple,
        Colors.purpleAccent
      ]).createShader(Rect.fromCircle(center: center, radius: size.width / 2));

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(-90),
        math.radians(progressInDegrees),
        false,
        progressPaint);
    // canvas.drawArc(Rect.fromCircle(center: center, radius: size.width / 3),
    //     math.radians(-90), math.radians(250), false, progressPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
