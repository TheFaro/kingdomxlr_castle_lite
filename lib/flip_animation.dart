import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Flip extends StatefulWidget{
  @override
  FlipState createState() => new FlipState();
}

class FlipState extends State<Flip>{

  bool _showFrontSide;
  bool _flipXAxis;

  @override
  void initState(){
    super.initState();
    _showFrontSide = true;
    _flipXAxis = true;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('FLip Animation.'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: RotatedBox(
              child: Icon(Icons.flip),
              quarterTurns: _flipXAxis ? 0 : 1,
            ),
            onPressed: _changeRotationAxis,
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage('assets/images/website.jpg'),
                fit: BoxFit.contain,
              ),
            ),
          ),

          Positioned.fill(
            bottom: MediaQuery.of(context).size.height * 0.2,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                constraints: BoxConstraints.tight(Size.square(60.0)),
                child: _buildFlipAnimation(),
              ),
            ),
          ),
        ]
      ),
    );
  }

  void _changeRotationAxis(){
    setState(() {
      _flipXAxis = !_flipXAxis;
    });
  }

  void _switchCard(){
    setState(() {
      _showFrontSide = !_showFrontSide;
    });
  }

  Widget _buildFlipAnimation(){
    return GestureDetector(
      onTap: () => _switchCard(),
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 800),
        transitionBuilder: __transitionBuilder,
        layoutBuilder: (widget, list) => Stack(children: [widget, ...list],),
        child: _showFrontSide ? _buildFront() : _buildRear(),
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeInBack.flipped,
      ),
    );
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation){
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: animation,
      child: widget,
      builder: (context, widget){
        final isUnder = (ValueKey(_showFrontSide) != widget.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value = isUnder ? min(rotateAnim.value, pi/2) : rotateAnim.value;
        return Transform(
          transform: _flipXAxis ? (Matrix4.rotationY(value)..setEntry(3,0, tilt)) : (Matrix4.rotationX(value)..setEntry(3, 1, tilt)),
          child: widget,
          alignment: Alignment.center,
        );
      }
    );
  }

  Widget __buildLayout({Key key, Color backgroundColor, String image}){
    return Container(
      key: key,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
      ),
      child: Center(
        child: Image.asset(image),
      ),
    );
  }

  Widget _buildFront(){
    return __buildLayout(
      key: ValueKey(true),
      backgroundColor: Colors.transparent,
      image: 'assets/images/download.png'
    );
  }

  Widget _buildRear(){
    return __buildLayout(
      key: ValueKey(false),
      backgroundColor: Colors.transparent,
      image: 'assets/images/download_reverse.png'
    );
  }
}