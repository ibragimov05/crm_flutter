import 'package:flutter/material.dart';

extension SizedBoxExtension on int {
  Widget get sizedBoxH => SizedBox(height: toDouble());

  Widget get sizedBoxW => SizedBox(width: toDouble());
}
