import 'package:flutter/material.dart';
class InheritedNose extends InheritedWidget {

  final Color noseColor;

  const InheritedNose({super.key, required Widget child, required this.noseColor}) : super(child: child);

  static InheritedNose of(BuildContext context) {
    final InheritedNose? result = context.dependOnInheritedWidgetOfExactType<InheritedNose>();
    assert(result != null, 'No InheritedNose found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(InheritedNose old) {
    return noseColor != old.noseColor;
  }
}
