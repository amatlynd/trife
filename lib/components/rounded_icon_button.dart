import 'package:flutter/material.dart';
import 'dart:async';

import 'package:trife/constants.dart';


class RoundIconButton extends StatefulWidget {
  final Function callback;
  final IconData icon;

  RoundIconButton({this.icon, this.callback});

  @override
  _RoundIconButtonState createState() => _RoundIconButtonState();
}

class _RoundIconButtonState extends State<RoundIconButton> {
  Timer _timer;
  Color _buttonColor = kInactiveButtonColor;
  Color _iconColor = kInactiveIconColor;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      child: Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.all(45),
        decoration: BoxDecoration(
          color: _buttonColor,
          shape: BoxShape.circle
        ),
        child: Center(
            child: Icon(
                widget.icon,
                color: _iconColor,
            )
        ),
      ),
      onTapDown: (TapDownDetails details) {
        print('down');
        _buttonColor = kActiveButtonColor;
        _iconColor = kActiveIconColor;
        widget.callback();
        _timer = Timer.periodic(Duration(milliseconds: 100), (t) {
          widget.callback();
        });
      },
      onTapUp: (TapUpDetails details) {
        print('up');
        setState(() {
          _buttonColor = kInactiveButtonColor;
          _iconColor = kInactiveIconColor;
        });
        _timer.cancel();
      },
      onTapCancel: () {
        print('cancel');
        setState(() {
          _iconColor = kInactiveIconColor;;
        });
        _timer.cancel();
      },
    );
  }
}


