import 'package:flutter/material.dart';

class ApplicationState with ChangeNotifier {
  bool _isGrey = true;
  bool _isUnSelected = true;

  bool get isUnSelected => _isUnSelected;
  set isUnSelected(bool value) {
    _isUnSelected = value;
    notifyListeners();
  }

  Image get image => _isUnSelected
      ? Image.asset(
          'assets/images/unselected.png',
          height: 20,
        )
      : Image.asset(
          'assets/images/selected.png',
          height: 20,
        );

  bool get isGrey => _isGrey;
  set isGrey(bool value) {
    _isGrey = value;
    notifyListeners();
  }

  Color get color =>
      _isGrey ? const Color(0xff4d5b7c) : const Color(0xff007dff);
}
