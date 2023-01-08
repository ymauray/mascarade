import 'package:flutter/material.dart';
import 'package:mascarade/utils/layout_type.dart';

abstract class LayoutAwareWidget {
  LayoutType getLayout(BoxConstraints constraints) {
    return constraints.minWidth < 800 ? LayoutType.narrow : LayoutType.wide;
  }
}
