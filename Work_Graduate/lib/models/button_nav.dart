import 'package:flutter/material.dart';


class ButtonNavigation {
  Widget _screen;

  ButtonNavigation(this._screen);

  Widget get screen => _screen;

  set screen(Widget value) {
    _screen = value;
  }
}